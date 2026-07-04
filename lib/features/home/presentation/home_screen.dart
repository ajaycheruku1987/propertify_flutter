import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:propertify/features/auth/bloc/auth_bloc.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/features/create_post/presentation/map_screen.dart';
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

  final List<String> _tabs = ['Feeds', 'Requests', 'Projects', 'Services'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
      context.read<AuthBloc>().add(const AuthEvent.clearShowOtpWidget());
      await _initCurrentLocation();

      context.read<HomeBloc>().add(const HomeEvent.checkToken());
      context.read<CompanyBloc>().add(const CompanyEvent.getMyCompany());

      // Set initial tab (e.g., Services) if provided via routing
      context.read<HomeBloc>().add(
        HomeEvent.setHomeIndex(widget.initialHomeIndex),
      );

      // Load services (ServicesListWidget handles initial fetch when tab is shown)

      // Initialize current location and update HomeBloc
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: _isLoadingLocation
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Fetching location...',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                : _builBottomNavContent(bottomNavIndex: state.bottomNavIndex),
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
          if (false)
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 24,
                    color: Colors.black54,
                  ),
                ),
                Positioned(
                  right: 3,
                  top: 3,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildContent({required int tabIndex}) {
    // This will show different content based on selected tab
    switch (tabIndex) {
      case 0: // Feeds
        return _buildFeedsContent();
      case 1:
        return const RequestsScreen();
      case 2: // Request
        return _buildSalesContent();
      case 3: // Services
        return _buildServicesContent();
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
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Set loading to false even if permission denied
        if (mounted) {
          setState(() {
            _isLoadingLocation = false;
          });
        }
        return;
      }
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get address details for current location
      String city = '';
      String state = '';
      String village = '';

      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          final placemark = placemarks.first;
          city =
              placemark.locality ??
              placemark.subAdministrativeArea ??
              placemark.administrativeArea ??
              '';

          state = placemark.administrativeArea ?? '';

          village =
              placemark.subLocality ??
              placemark.thoroughfare ??
              placemark.subThoroughfare ??
              '';
        }
      } catch (e) {
        print('Error getting address: $e');
      }

      if (mounted) {
        context.read<HomeBloc>().add(
          HomeEvent.updateCurrentLocation(
            lat: position.latitude,
            lng: position.longitude,
            city: city,
            state: state,
            village: village,
          ),
        );
        // Set loading to false after location is fetched
        setState(() {
          _isLoadingLocation = false;
        });
      }
    } catch (_) {
      // Set loading to false on error
      if (mounted) {
        setState(() {
          _isLoadingLocation = false;
        });
      }
    }
  }

  String _getLocationText() {
    final state = context.watch<HomeBloc>().state;

    // Build location text from village, city, and state
    final parts = <String>[];

    if (state.currentVillage.isNotEmpty) {
      parts.add(state.currentVillage);
    }

    if (state.currentCity.isNotEmpty) {
      parts.add(state.currentCity);
    }

    // if (state.currentState.isNotEmpty) {
    //   parts.add(state.currentState);
    // }

    if (parts.isNotEmpty) {
      return parts.join(', ');
    }

    // Fallback to coordinates if no address data
    if (state.currentLat != 0.0 && state.currentLng != 0.0) {
      return '${state.currentLat.toStringAsFixed(2)}, ${state.currentLng.toStringAsFixed(2)}';
    }

    // Default fallback
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

  Future<void> _openMapScreen() async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (context) => const MapScreen()),
    );

    if (result != null && mounted) {
      final Map<String, dynamic> locationData = result;

      context.read<HomeBloc>().add(
        HomeEvent.updateCurrentLocation(
          lat: double.parse(locationData['lat']),
          lng: double.parse(locationData['long']),
          city: locationData['city'],
          state: locationData['state'],
          village: locationData['village'],
        ),
      );

      Future.delayed(Duration(seconds: 1), () {
        context.read<FeedBloc>().add(
          FeedEvent.getFeedsEvent(
            latitude: context.read<HomeBloc>().state.currentLat,
            longitude: context.read<HomeBloc>().state.currentLng,
          ),
        );
        context.read<RequestsBloc>().add(
          RequestsEvent.getRequests(
            latitude: context.read<HomeBloc>().state.currentLat,
            longitude: context.read<HomeBloc>().state.currentLng,
            radiusKm: 5,
          ),
        );
        context.read<ServicesBloc>().add(
          ServicesEvent.getServicesEvent(
            latitude: context.read<HomeBloc>().state.currentLat,
            longitude: context.read<HomeBloc>().state.currentLng,
            radiusKm: 5,
          ),
        );
      });
    }
  }

  Widget mainContent(HomeState state) {
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

    final maxHeight = 245.0;

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              expandedHeight: maxHeight,
              collapsedHeight: 70.0,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: innerBoxIsScrolled ? 2.0 : 0.0,
              shadowColor: Colors.black.withOpacity(0.1),
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate scroll progress
                  final currentHeight = constraints.maxHeight;
                  final minHeight = 70.0;
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
                                      tabs: _tabs,
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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 4,
                              bottom: 12,
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
                                      context.read<HomeBloc>().add(
                                        HomeEvent.updateFeedsFilter(filterData),
                                      );
                                      final lookingFor =
                                          filterData['lookingFor'] as String?;
                                      final mappedLookingFor =
                                          lookingFor == 'Sales'
                                          ? 'Sell'
                                          : (lookingFor == 'All' ||
                                                lookingFor == '')
                                          ? null
                                          : lookingFor;

                                      final propertyTypes =
                                          filterData['propertyTypes'] as List?;
                                      final propertyType =
                                          propertyTypes != null &&
                                              propertyTypes.isNotEmpty &&
                                              !propertyTypes.contains('All')
                                          ? propertyTypes.first as String?
                                          : null;

                                      final isLocationCustom =
                                          filterData['isLocationCustom'] ==
                                          true;
                                      final latitude = isLocationCustom
                                          ? filterData['latitude'] as double?
                                          : homeState.currentLat;
                                      final longitude = isLocationCustom
                                          ? filterData['longitude'] as double?
                                          : homeState.currentLng;

                                      context.read<FeedBloc>().add(
                                        FeedEvent.getFeedsEvent(
                                          search: homeState.searchQuery,
                                          city:
                                              filterData['location'] as String?,
                                          listingType: mappedLookingFor,
                                          propertyType: propertyType,
                                          minPrice:
                                              (filterData['priceRange']
                                                      as Map?)?['min']
                                                  ?.toDouble(),
                                          maxPrice:
                                              (filterData['priceRange']
                                                      as Map?)?['max']
                                                  ?.toDouble(),
                                          latitude: latitude,
                                          longitude: longitude,
                                        ),
                                      );
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

  Widget _builBottomNavContent({required int bottomNavIndex}) {
    switch (bottomNavIndex) {
      case 0:
        return mainContent(context.watch<HomeBloc>().state);
      case 1:
        return ReelsScreen();
      case 2:
        return const BuilderSmartScreen();
      case 3:
        return ProfileScreen();
      default:
        return _buildFeedsContent();
    }
  }
}
