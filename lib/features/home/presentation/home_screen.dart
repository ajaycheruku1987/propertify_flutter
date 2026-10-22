import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'package:propertify/core/constants/app_categories.dart';
import 'package:propertify/utils/location_service.dart';
import 'package:propertify/utils/string_extensions.dart';
import 'package:propertify/features/auth/bloc/auth_bloc.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/features/create_post/presentation/map_screen.dart';
import '../../../core/app_cache_service.dart';
import '../../../core/notification_service.dart';
import '../../../core/service_locator.dart';
import '../../feed/presentation/favorites_screen.dart';
import '../../feed/presentation/my_post_comments_screen.dart';
import '../../notifications/bloc/notifications_bloc.dart';
import '../../notifications/presentation/notifications_screen.dart';
import '../../services/presentation/builder_smart_screen.dart';
import 'package:propertify/features/feed/presentation/feed_list_widget.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/requests/bloc/requests_bloc.dart';

import '../../feed/bloc/feed_bloc.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../reels/presentation/reels_screen.dart';
import '../../requests/presentation/requests_screen.dart';
import '../../sales/bloc/sales_bloc.dart';
import '../../sales/presentation/widgets/sales_list_widget.dart';
import '../../services/bloc/services_bloc.dart';
import '../../services/presentation/services_list_widget.dart';
import '../bloc/home_bloc.dart';
import 'widgets/bottom_navigation_widget.dart';
import 'widgets/create_or_add_bottom_sheet.dart';
import 'widgets/feeds_filter.dart';
import 'widgets/location_selector.dart';
import 'widgets/navigation_tabs.dart';
import 'widgets/requests_filter.dart';
import 'widgets/sales_filter.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/services_filter.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  final bool shouldRefresh;
  final int initialHomeIndex;

  const HomeScreen({
    super.key,
    this.shouldRefresh = false,
    this.initialHomeIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return _HomeScreenWrapper(
      shouldRefresh: shouldRefresh,
      initialHomeIndex: initialHomeIndex,
    );
  }
}

class _HomeScreenWrapper extends StatelessWidget {
  final bool shouldRefresh;
  final int initialHomeIndex;

  const _HomeScreenWrapper({
    super.key,
    this.shouldRefresh = false,
    this.initialHomeIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return _HomeScreenContent(
      shouldRefresh: shouldRefresh,
      initialHomeIndex: initialHomeIndex,
    );
  }
}

class _HomeScreenContent extends StatefulWidget {
  final bool shouldRefresh;
  final int initialHomeIndex;

  const _HomeScreenContent({
    super.key,
    this.shouldRefresh = false,
    this.initialHomeIndex = 0,
  });

  @override
  State<_HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<_HomeScreenContent> {
  int _selectedTabIndex = 0;
  int _selectedBottomNavIndex = 0;
  int _currentSlide = 0;
  bool _isLoadingLocation = true; // Track location loading state
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appCache = serviceLocator<AppCacheService>();
      final token = appCache.getToken();
      if (token != null && token.isNotEmpty) {
        context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
        context.read<CompanyBloc>().add(const CompanyEvent.getMyCompany());
      }
      context.read<AuthBloc>().add(const AuthEvent.clearShowOtpWidget());
      context.read<HomeBloc>().add(const HomeEvent.checkToken());
      context.read<CompanyBloc>().add(const CompanyEvent.getMyCompany());
      context.read<HomeBloc>().add(
        HomeEvent.setHomeIndex(widget.initialHomeIndex),
      );

      // Fetch location in parallel — do not block home UI or other init work.
      _initCurrentLocation();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<String> tabs = [
      l10n.feeds,
      // l10n.requests,
      // l10n.projects,
      // l10n.services,
    ];

    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) {
        // Only refetch when coordinates change — address labels update separately.
        return (previous.currentLat != current.currentLat ||
            previous.currentLng != current.currentLng) &&
            (current.currentLat != 0.0 || current.currentLng != 0.0);
      },
      listener: (context, state) {
        _fetchDataForCurrentLocation(context, state);
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: _builBottomNavContent(
              bottomNavIndex: state.bottomNavIndex,
              tabs: tabs,
            ),
          ),
          floatingActionButton: _buildFloatingActionButton(),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          bottomNavigationBar: BottomNavigationWidget(
            selectedIndex: context.watch<HomeBloc>().state.bottomNavIndex,
            isLoggedIn: state.showAddButton,
            onItemTapped: (index) {
              context.read<HomeBloc>().add(HomeEvent.setBottomNavIndex(index));
            },
          ),
        );
      },
    );
  }

  Widget _buildFloatingActionButton() {
    return GestureDetector(
      onTap: () async {
        await CreateOrAddBottomSheet.show(context);
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: LocationSelector(
              location: _getLocationText(),
              onLocationPressed: _openMapScreen,
            ),
          ),
          const SizedBox(width: 8),
          _buildAddListingButton(),
          const SizedBox(width: 8),
          BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, state) {
              final unreadCount = state.unreadNotifications.length;
              return GestureDetector(
                onTap: () {
                  context.push(NotificationsScreen.routeName);
                },
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        size: 24,
                        color: Colors.black54,
                      ),
                    ),
                    if (unreadCount > 0)
                      Positioned(
                        right: 3,
                        top: 3,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '$unreadCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddListingButton() {
    return GestureDetector(
      onTap: () async {
        await CreateOrAddBottomSheet.show(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              size: 16,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'FREE',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _applyFeedsFilter(
      BuildContext context,
      Map<String, dynamic> filterData,
      ) {
    context.read<HomeBloc>().add(HomeEvent.updateFeedsFilter(filterData));
    final propertyTypes = filterData['propertyTypes'] as List?;
    final lookingFor = filterData['lookingFor'] as String?;
    final isLocationCustom = filterData['isLocationCustom'] == true;

    final homeState = context.read<HomeBloc>().state;
    final latitude = isLocationCustom
        ? filterData['latitude'] as double?
        : homeState.currentLat;
    final longitude = isLocationCustom
        ? filterData['longitude'] as double?
        : homeState.currentLng;

    final mappedLookingFor =
    AppCategories.mapLookingForToListingType(lookingFor);
    final resolved = AppCategories.resolvePropertyFilter(propertyTypes);

    context.read<FeedBloc>().add(
      FeedEvent.getFeedsEvent(
        offset: 0,
        search: homeState.searchQuery,
        city: filterData['location'] as String?,
        listingType: mappedLookingFor,
        propertyType: resolved.propertyType,
        mainCategory: resolved.mainCategory,
        minPrice: (filterData['priceRange'] as Map?)?['min']?.toDouble(),
        maxPrice: (filterData['priceRange'] as Map?)?['max']?.toDouble(),
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  Widget _buildCategorySelector(BuildContext context) {
    final homeState = context.watch<HomeBloc>().state;
    final activeFilter = homeState.activeFeedsFilter;
    final propertyTypes = activeFilter?['propertyTypes'] as List?;
    final String currentSelectedCategory =
    (propertyTypes != null && propertyTypes.isNotEmpty)
        ? propertyTypes.first as String
        : 'All';

    // Show main categories + all subcategories so new types are visible.
    final List<Map<String, dynamic>> categories = [
      {'name': 'All', 'icon': Icons.apps},
      ...AppCategories.mainPropertyCategories,
      ...AppCategories.propertyType,
    ];

    return Container(
      height: 44,
      padding: EdgeInsets.zero,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final categoryName = cat['name'] as String;
          final bool isSelected = currentSelectedCategory == categoryName;
          final theme = Theme.of(context);

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(categoryName.translate(context)),
              selected: isSelected,
              onSelected: (selected) {
                if (!selected) return;
                if (categoryName == 'All') {
                  context
                      .read<HomeBloc>()
                      .add(const HomeEvent.updateFeedsFilter(null));
                  context
                      .read<HomeBloc>()
                      .add(const HomeEvent.updateSearchQuery(''));
                  context.read<FeedBloc>().add(
                    FeedEvent.getFeedsEvent(
                      latitude: context.read<HomeBloc>().state.currentLat,
                      longitude: context.read<HomeBloc>().state.currentLng,
                    ),
                  );
                  return;
                }

                final currentFilter =
                    context.read<HomeBloc>().state.activeFeedsFilter ?? {};
                final newFilter = Map<String, dynamic>.from(currentFilter);
                newFilter['propertyTypes'] = [categoryName];

                _applyFeedsFilter(context, newFilter);
              },
              selectedColor: theme.primaryColor,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? theme.primaryColor : Colors.grey.shade300,
                  width: 1,
                ),
              ),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 13,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent({required int tabIndex}) {
    // This will show different content based on selected tab
    switch (tabIndex) {
      case 0: // Feeds
        return _buildFeedsContent();
    /*
      case 1:
        return const RequestsScreen();
      case 2: // Request
        return _buildSalesContent();
      case 3: // Services
        return _buildServicesContent();
      */
      default:
        return _buildFeedsContent();
    }
  }

  Widget _buildFeedsContent() {
    return const FeedListWidget();
  }

  Widget _buildAgentsContent() {
    return const Center(
      child: Text(
        'Agents Content',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildServicesContent() {
    return const ServicesListWidget();
  }

  Widget _buildSalesContent() {
    return const SalesListWidget();
  }

  Future<void> _initCurrentLocation() async {
    try {
      final hasPermission = await LocationService.ensurePermission();

      // Request notification permission next, sequentially after location permission.
      try {
        await NotificationService.instance.requestPermission();
      } catch (e) {
        debugPrint('Notification permission error: $e');
      }

      if (!hasPermission) return;

      // 1) Use cached last-known immediately (instant on later launches).
      final lastKnown = await LocationService.getLastKnown();
      if (lastKnown != null && mounted) {
        context.read<HomeBloc>().add(
          HomeEvent.currentLocationLatLng(
            lastKnown.latitude,
            lastKnown.longitude,
          ),
        );
        if (mounted) setState(() => _isLoadingLocation = false);
      }

      // 2) Fresh fix with medium accuracy + timeout (fast on first install too).
      final position = await LocationService.getQuickCurrentPosition(
        fallback: lastKnown,
      );
      if (position == null || !mounted) return;

      final movedSignificantly = lastKnown == null ||
          (position.latitude - lastKnown.latitude).abs() > 0.001 ||
          (position.longitude - lastKnown.longitude).abs() > 0.001;

      if (movedSignificantly) {
        context.read<HomeBloc>().add(
          HomeEvent.currentLocationLatLng(
            position.latitude,
            position.longitude,
          ),
        );
      }

      // 3) Address labels after coords — does not block feeds.
      final address = await LocationService.reverseGeocode(
        position.latitude,
        position.longitude,
      );
      if (!mounted) return;

      context.read<HomeBloc>().add(
        HomeEvent.updateCurrentLocation(
          lat: position.latitude,
          lng: position.longitude,
          city: address.city,
          state: address.state,
          village: address.village,
        ),
      );
    } catch (_) {
      // Ignore — user can pick a location manually.
    } finally {
      if (mounted) setState(() => _isLoadingLocation = false);
    }
  }

  String _getLocationText() {
    final state = context.watch<HomeBloc>().state;

    if (_isLoadingLocation &&
        state.currentLat == 0.0 &&
        state.currentLng == 0.0) {
      return 'Detecting...';
    }

    // Build location text from village, city, and state
    final parts = <String>[];

    if (state.currentVillage.isNotEmpty) {
      parts.add(state.currentVillage);
    }

    if (state.currentCity.isNotEmpty) {
      parts.add(state.currentCity);
    }

    if (parts.isNotEmpty) {
      return parts.join(', ');
    }

    // Fallback to coordinates if no address data
    if (state.currentLat != 0.0 && state.currentLng != 0.0) {
      return '${state.currentLat.toStringAsFixed(2)}, ${state.currentLng.toStringAsFixed(2)}';
    }

    return '-';
  }

  String _getCurrentAddress(HomeState homeState) {
    final parts = <String>[];
    if (homeState.currentVillage.isNotEmpty) {
      parts.add(homeState.currentVillage);
    }
    if (homeState.currentCity.isNotEmpty) {
      parts.add(homeState.currentCity);
    }
    return parts.isNotEmpty ? parts.join(', ') : '';
  }

  void _fetchDataForCurrentLocation(
      BuildContext context,
      HomeState homeState,
      ) {
    if (homeState.currentLat == 0.0 && homeState.currentLng == 0.0) return;

    final filterData = homeState.activeFeedsFilter;

    String? city;
    String? listingType;
    String? propertyType;
    String? mainCategory;
    double? minPrice;
    double? maxPrice;
    double? latitude = homeState.currentLat;
    double? longitude = homeState.currentLng;

    if (filterData != null) {
      city = filterData['location'] as String?;
      listingType = AppCategories.mapLookingForToListingType(
        filterData['lookingFor'] as String?,
      );

      final resolved = AppCategories.resolvePropertyFilter(
        filterData['propertyTypes'] as List?,
      );
      propertyType = resolved.propertyType;
      mainCategory = resolved.mainCategory;

      minPrice = (filterData['priceRange'] as Map?)?['min']?.toDouble();
      maxPrice = (filterData['priceRange'] as Map?)?['max']?.toDouble();

      final isLocationCustom = filterData['isLocationCustom'] == true;
      if (isLocationCustom) {
        latitude = filterData['latitude'] as double?;
        longitude = filterData['longitude'] as double?;
      }
    }

    context.read<FeedBloc>().add(
      FeedEvent.getFeedsEvent(
        offset: 0,
        search: homeState.searchQuery,
        city: city,
        listingType: listingType,
        propertyType: propertyType,
        mainCategory: mainCategory,
        minPrice: minPrice,
        maxPrice: maxPrice,
        latitude: latitude,
        longitude: longitude,
      ),
    );

    context.read<RequestsBloc>().add(
      RequestsEvent.getRequests(
        latitude: latitude,
        longitude: longitude,
        radiusKm: 5,
      ),
    );

    context.read<ServicesBloc>().add(
      ServicesEvent.getServicesEvent(
        latitude: latitude,
        longitude: longitude,
        radiusKm: 5,
      ),
    );
  }

  Future<void> _openMapScreen() async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (context) => const MapScreen()),
    );

    if (result != null && mounted) {
      final Map<String, dynamic> locationData = result;

      final homeState = context.read<HomeBloc>().state;
      if (homeState.activeFeedsFilter != null) {
        final newFilter = Map<String, dynamic>.from(
          homeState.activeFeedsFilter!,
        );
        newFilter['isLocationCustom'] = false;
        newFilter['location'] = null;
        newFilter['latitude'] = null;
        newFilter['longitude'] = null;
        context.read<HomeBloc>().add(HomeEvent.updateFeedsFilter(newFilter));
      }

      context.read<HomeBloc>().add(
        HomeEvent.updateCurrentLocation(
          lat: double.parse(locationData['lat']),
          lng: double.parse(locationData['long']),
          city: locationData['city'],
          state: locationData['state'],
          village: locationData['village'],
        ),
      );
    }
  }

  Widget mainContent(HomeState state, List<String> tabs) {
    final currentTabIndex = state.homeIndex;
    bool hasActiveFilter = false;
    if (currentTabIndex == 0) {
      hasActiveFilter = state.activeFeedsFilter != null;
    } else if (currentTabIndex == 1) {
      hasActiveFilter = state.activeRequestsFilter != null;
    } else if (currentTabIndex == 2) {
      hasActiveFilter = state.activeSalesFilter != null;
    } else if (currentTabIndex == 3) {
      hasActiveFilter = state.activeServicesFilter != null;
    }

    final maxHeight = 210.0;

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              expandedHeight: maxHeight,
              collapsedHeight: 80.0,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: innerBoxIsScrolled ? 2.0 : 0.0,
              shadowColor: Colors.black.withOpacity(0.1),
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate scroll progress
                  final currentHeight = constraints.maxHeight;
                  final minHeight = 80.0;
                  final progress =
                  ((maxHeight - currentHeight) / (maxHeight - minHeight))
                      .clamp(0.0, 1.0);
                  final fadeOpacity = (1.0 - progress).clamp(0.0, 1.0);

                  return Stack(
                    children: [
                      // Background SVG - Always visible, fades from 95% to 40%
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.40 + (fadeOpacity * 0.55), // 40% to 95%
                          child: SvgPicture.asset(
                            'assets/images/auth_bg.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Gradient overlay - White on top fading to primary color
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.65),
                                Colors.white.withOpacity(0.55),
                                Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.15 * fadeOpacity),
                                Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.30 * fadeOpacity),
                              ],
                              stops: const [0.0, 0.4, 0.75, 1.0],
                            ),
                          ),
                        ),
                      ),
                      // Content
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Location Header - fades out
                          if (fadeOpacity > 0)
                            SizedBox(
                              height: 70.0 * fadeOpacity,
                              child: Opacity(
                                opacity: fadeOpacity,
                                child: ClipRect(
                                  child: OverflowBox(
                                    maxHeight: 85.0,
                                    alignment: Alignment.topCenter,
                                    child: _buildTopHeader(),
                                  ),
                                ),
                              ),
                            ),

                          // Navigation Tabs - fades out
                          /*
                          if (fadeOpacity > 0)
                            SizedBox(
                              height: 95.0 * fadeOpacity,
                              child: Opacity(
                                opacity: fadeOpacity,
                                child: ClipRect(
                                  child: OverflowBox(
                                    maxHeight: 109.0,
                                    alignment: Alignment.topCenter,
                                    child: NavigationTabs(
                                      tabs: tabs,
                                      selectedIndex: state.homeIndex,
                                      onTabSelected: (index) {
                                        context.read<HomeBloc>().add(
                                          HomeEvent.setHomeIndex(index),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          */
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 4,
                              bottom: 4,
                            ),
                            child: SearchBarWidget(
                              controller: _searchController,
                              hasActiveFilter: hasActiveFilter,
                              onChanged: (searchQuery) {
                                final currentTabIndex = state.homeIndex;
                                final homeState = context
                                    .read<HomeBloc>()
                                    .state;

                                context.read<HomeBloc>().add(
                                  HomeEvent.updateSearchQuery(searchQuery),
                                );

                                if (currentTabIndex == 0) {
                                  context.read<FeedBloc>().add(
                                    FeedEvent.getFeedsEvent(
                                      search: searchQuery,
                                      latitude: homeState.currentLat,
                                      longitude: homeState.currentLng,
                                    ),
                                  );
                                }else if (currentTabIndex == 1) {
                                  context.read<RequestsBloc>().add(
                                    RequestsEvent.getRequests(
                                      search: searchQuery,
                                      latitude: homeState.currentLat,
                                      longitude: homeState.currentLng,
                                      radiusKm: 5,
                                    ),
                                  );
                                } else if (currentTabIndex == 2) {
                                  context.read<SalesBloc>().add(
                                    SalesEvent.getSalesEvent(
                                      search: searchQuery,
                                    ),
                                  );
                                } else if (currentTabIndex == 3) {
                                  context.read<ServicesBloc>().add(
                                    ServicesEvent.getServicesEvent(
                                      search: searchQuery,
                                      latitude: homeState.currentLat,
                                      longitude: homeState.currentLng,
                                      radiusKm: 5,
                                    ),
                                  );
                                }
                              },
                              onFilterPressed: () {
                                final currentTabIndex = state.homeIndex;
                                final homeState = context
                                    .read<HomeBloc>()
                                    .state;
                                final currentAddress = _getCurrentAddress(
                                  homeState,
                                );
                                final currentCity =
                                homeState.currentCity.isNotEmpty
                                    ? homeState.currentCity
                                    : 'Hyderabad';

                                if (currentTabIndex == 0) {
                                  FeedsFilter.show(
                                    context,
                                    activeFilter: homeState.activeFeedsFilter,
                                    currentAddress: currentAddress,
                                    currentCity: currentCity,
                                    onApplyFilter: (filterData) {
                                      _applyFeedsFilter(context, filterData);
                                    },
                                    onResetFilter: () {
                                      context.read<HomeBloc>().add(
                                        const HomeEvent.updateFeedsFilter(null),
                                      );
                                      _searchController.clear();
                                      context.read<HomeBloc>().add(
                                        const HomeEvent.updateSearchQuery(''),
                                      );
                                      context.read<FeedBloc>().add(
                                        FeedEvent.getFeedsEvent(
                                          latitude: homeState.currentLat,
                                          longitude: homeState.currentLng,
                                        ),
                                      );
                                    },
                                  );
                                } else if (currentTabIndex == 1) {
                                  RequestsFilter.show(
                                    context,
                                    activeFilter:
                                    homeState.activeRequestsFilter,
                                    currentAddress: currentAddress,
                                    currentCity: currentCity,
                                    onApplyFilter: (filterData) {
                                      context.read<HomeBloc>().add(
                                        HomeEvent.updateRequestsFilter(
                                          filterData,
                                        ),
                                      );
                                      final isLocationCustom =
                                          filterData['isLocationCustom'] ==
                                              true;
                                      final latitude = isLocationCustom
                                          ? filterData['latitude'] as double?
                                          : homeState.currentLat;
                                      final longitude = isLocationCustom
                                          ? filterData['longitude'] as double?
                                          : homeState.currentLng;

                                      context.read<RequestsBloc>().add(
                                        RequestsEvent.getRequests(
                                          search: homeState.searchQuery,
                                          city:
                                          filterData['address'] as String?,
                                          latitude: latitude,
                                          longitude: longitude,
                                          radiusKm: 15,
                                        ),
                                      );
                                    },
                                    onResetFilter: () {
                                      context.read<HomeBloc>().add(
                                        const HomeEvent.updateRequestsFilter(
                                          null,
                                        ),
                                      );
                                      _searchController.clear();
                                      context.read<HomeBloc>().add(
                                        const HomeEvent.updateSearchQuery(''),
                                      );
                                      context.read<RequestsBloc>().add(
                                        RequestsEvent.getRequests(
                                          latitude: homeState.currentLat,
                                          longitude: homeState.currentLng,
                                          radiusKm: 5,
                                        ),
                                      );
                                    },
                                  );
                                } else if (currentTabIndex == 2) {
                                  SalesFilter.show(
                                    context,
                                    activeFilter: homeState.activeSalesFilter,
                                    currentAddress: currentAddress,
                                    currentCity: currentCity,
                                    onApplyFilter: (filterData) {
                                      context.read<HomeBloc>().add(
                                        HomeEvent.updateSalesFilter(filterData),
                                      );

                                      final propertyTypes =
                                      filterData['propertyTypes'] as List?;
                                      final List<String>? types =
                                      propertyTypes != null &&
                                          propertyTypes.isNotEmpty &&
                                          !propertyTypes.contains('All')
                                          ? List<String>.from(propertyTypes)
                                          : null;

                                      final isLocationCustom =
                                          filterData['isLocationCustom'] == true;
                                      final latitude = isLocationCustom
                                          ? filterData['latitude'] as double?
                                          : homeState.currentLat;
                                      final longitude = isLocationCustom
                                          ? filterData['longitude'] as double?
                                          : homeState.currentLng;

                                      context.read<SalesBloc>().add(
                                        SalesEvent.getSalesEvent(
                                          search: homeState.searchQuery,
                                          propertyTypes: types,
                                          latitude: latitude,
                                          longitude: longitude,
                                          radiusKm: 15,
                                        ),
                                      );
                                    },
                                    onResetFilter: () {
                                      context.read<HomeBloc>().add(
                                        const HomeEvent.updateSalesFilter(null),
                                      );
                                      _searchController.clear();
                                      context.read<HomeBloc>().add(
                                        const HomeEvent.updateSearchQuery(''),
                                      );
                                      context.read<SalesBloc>().add(
                                        const SalesEvent.getSalesEvent(),
                                      );
                                    },
                                  );
                                } else if (currentTabIndex == 3) {
                                  ServicesFilter.show(
                                    context,
                                    activeFilter:
                                    homeState.activeServicesFilter,
                                    currentAddress: currentAddress,
                                    currentCity: currentCity,
                                    onApplyFilter: (filterData) {
                                      context.read<HomeBloc>().add(
                                        HomeEvent.updateServicesFilter(
                                          filterData,
                                        ),
                                      );
                                      final List<String> categoriesList = [];
                                      final String? serviceType =
                                      filterData['serviceType'] as String?;
                                      if (serviceType != null &&
                                          serviceType != 'All') {
                                        categoriesList.add(serviceType);
                                      }
                                      final List? categories =
                                      filterData['categories'] as List?;
                                      if (categories != null) {
                                        for (final cat in categories) {
                                          if (cat != 'All' && cat is String) {
                                            categoriesList.add(cat);
                                          }
                                        }
                                      }

                                      final isLocationCustom =
                                          filterData['isLocationCustom'] ==
                                              true;
                                      final latitude = isLocationCustom
                                          ? filterData['latitude'] as double?
                                          : homeState.currentLat;
                                      final longitude = isLocationCustom
                                          ? filterData['longitude'] as double?
                                          : homeState.currentLng;

                                      context.read<ServicesBloc>().add(
                                        ServicesEvent.getServicesEvent(
                                          search: homeState.searchQuery,
                                          categoryNames:
                                          categoriesList.isNotEmpty
                                              ? categoriesList
                                              : null,
                                          latitude: latitude,
                                          longitude: longitude,
                                          radiusKm: 15,
                                          minRating: filterData['minRating'] != null
                                              ? (filterData['minRating'] as num).toDouble()
                                              : null,
                                        ),
                                      );
                                    },
                                    onResetFilter: () {
                                      context.read<HomeBloc>().add(
                                        const HomeEvent.updateServicesFilter(
                                          null,
                                        ),
                                      );
                                      _searchController.clear();
                                      context.read<HomeBloc>().add(
                                        const HomeEvent.updateSearchQuery(''),
                                      );
                                      context.read<ServicesBloc>().add(
                                        ServicesEvent.getServicesEvent(
                                          latitude: homeState.currentLat,
                                          longitude: homeState.currentLng,
                                          radiusKm: 5,
                                        ),
                                      );
                                    },
                                  );
                                }else {
                                  FeedsFilter.show(
                                    context,
                                    currentAddress: currentAddress,
                                    currentCity: currentCity,
                                  );
                                }
                              },
                            ),
                          ),
                          if (fadeOpacity > 0)
                            SizedBox(
                              height: 46.0 * fadeOpacity,
                              child: Opacity(
                                opacity: fadeOpacity,
                                child: ClipRect(
                                  child: OverflowBox(
                                    maxHeight: 50.0,
                                    alignment: Alignment.topCenter,
                                    child: _buildCategorySelector(context),
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ];
      },
      body: _buildContent(tabIndex: state.homeIndex),
    );
  }

  Widget _builBottomNavContent({
    required int bottomNavIndex,
    required List<String> tabs,
  }) {
    switch (bottomNavIndex) {
      case 0:
        return mainContent(context.watch<HomeBloc>().state, tabs);
      case 1:
        return ReelsScreen();
      case 2:
        return const MyPostCommentsScreen();
      case 3:
        return ProfileScreen();
      default:
        return _buildFeedsContent();
    }
  }
}
