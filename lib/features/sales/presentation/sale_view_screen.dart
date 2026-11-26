import 'package:propertify/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:propertify/core/content_type.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/profile/presentation/other_user_profile_screen.dart';
import 'package:propertify/utils/common_widgets/select_plan_screen.dart';
import 'package:propertify/utils/extensions/price_format.dart';
import '../../feed/presentation/widgets/image_carousel.dart';
import '../models/sales_model.dart';
import '../models/sales_unit_model.dart';
import '../../../core/app_theme.dart';
import 'package:propertify/utils/fullscreenwidget.dart';
import '../../../utils/custom_toast.dart';
import 'package:propertify/utils/string_extensions.dart';
import 'package:share_plus/share_plus.dart';
import '../bloc/sales_bloc.dart';

import 'widgets/static_location_map_view.dart';
import '../../company/bloc/company_bloc.dart';
import '../../company/presentation/my_company.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';
import '../../feed/presentation/widgets/emi_calculator_widget.dart';
import '../../feed/presentation/widgets/stamp_duty_calculator_widget.dart';
import 'widgets/add_edit_unit_bottom_sheet.dart';
import 'sale_callback_requests_screen.dart';
import 'create_sales.dart';

class SaleViewScreen extends StatefulWidget {
  static const String routeName = '/sale-view';

  final SaleRecord sale;

  const SaleViewScreen({super.key, required this.sale});

  @override
  State<SaleViewScreen> createState() => _SaleViewScreenState();
}

class _SaleViewScreenState extends State<SaleViewScreen> {
  bool _isDescriptionExpanded = false;
  String _selectedSection = 'Overview'; // Track selected section

  @override
  void initState() {
    super.initState();
    // Dispatch BLoC event to fetch sale details by ID
    if (widget.sale.id != null) {
      context.read<SalesBloc>().add(
        SalesEvent.getSaleDetailsEvent(projectId: widget.sale.id!),
      );
      context.read<SalesBloc>().add(
        SalesEvent.getProjectUnits(projectId: widget.sale.id!),
      );
    }
  }

  void _handleShare(SaleRecord? sale) {
    if (sale == null) return;

    final String projectTitle = (sale.projectName ?? 'Project').capitalize().translate(context);
    final String projectDescription =
        (sale.description ?? 'Check out this project').translate(context);
    String postedBy = 'Propertify User';
    if (sale.owner != null) {
      final owner = sale.owner!;
      final firstName = owner.firstName?.trim() ?? '';
      final lastName = owner.lastName?.trim() ?? '';
      if (firstName.isNotEmpty || lastName.isNotEmpty) {
        postedBy = '$firstName $lastName'.trim().toTitleCase();
      } else {
        postedBy = (owner.username ?? 'Propertify User').toTitleCase();
      }
    }

    final String priceRange =
        sale.minPrice != null && sale.maxPrice != null
            ? '${formatPrice(sale.minPrice)} - ${formatPrice(sale.maxPrice)}'
            : sale.minPrice != null
            ? formatPrice(sale.minPrice)
            : '';

    final String location =
        '${(sale.city ?? '').translate(context)}${sale.state != null ? ", ${sale.state!.translate(context)}" : ""}'
            .trim();

    final String imageUrl =
        sale.imageUrls != null && sale.imageUrls!.isNotEmpty
            ? sale.imageUrls!.first
            : '';

    final String shareMessage = '''
🏢 $projectTitle
${priceRange.isNotEmpty ? '💰 Price: $priceRange' : ''}
📍 Location: $location

📝 Description:
$projectDescription

👤 Posted by: $postedBy

${imageUrl.isNotEmpty ? '📷 Image: $imageUrl' : ''}

Check out this project on Propertify!

📱 Download the app:
Android: https://play.google.com/store/apps/details?id=com.placeofsalesrealestate
iOS: https://apps.apple.com/in/app/propertify-buy-sell-rent/id6763365054
'''
        .trim();

    Share.share(shareMessage, subject: projectTitle);
  }

  void _showDeleteProjectDialog(BuildContext context, String projectId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Project'),
        content: const Text(
          'Are you sure you want to delete this project? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<SalesBloc>().add(
                DeleteSalesProjectEvent(projectId: projectId),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showDeleteUnitDialog(
    BuildContext context,
    SalesUnitModel unit,
    String projectId,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Unit'),
        content: Text(
          'Are you sure you want to delete Unit No. ${unit.unitNumber ?? ""}? ',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<SalesBloc>().add(
                DeleteProjectUnitEvent(
                  unitId: unit.id!,
                  projectId: projectId,
                ),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<SalesBloc, SalesState>(
      listener: (context, state) {
        if (state.notifyStatus?.message == 'Sales project deleted successfully') {
          Navigator.pop(context);
          return;
        }
        if (state.isError && state.notifyStatus != null) {
          CustomToast.showErrorToast(msg: state.notifyStatus!.message);
        }
        if (state.saleRecord != null && state.saleRecord!.userId != null) {
          context.read<CompanyBloc>().add(
            CompanyEvent.getUserCompany(userId: state.saleRecord!.userId!),
          );
        }
      },
      builder: (context, state) {
        // Only use the fetched data from API response
        final sale = state.saleRecord;

        // Show loading if data hasn't been fetched yet
        if (sale == null) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final bool isOwner =
            context.read<ProfileBloc>().state.userProfile?.id ==
            (sale.userId ?? sale.owner?.id);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            title: Text(
              l10n.details,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              if (isOwner) ...[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Colors.black),
                    onPressed: () {
                      context.push(CreateSalesScreen.routeName, extra: sale);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => _showDeleteProjectDialog(context, sale.id!),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.share, color: Colors.black),
                  onPressed: () => _handleShare(sale),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Carousel Section (moved from SliverAppBar)
                SizedBox(
                  height: (sale.imageUrls?.length ?? 0) > 1 ? 430 : 340,
                  child: ImageCarousel(
                    images: sale.imageUrls ?? [],
                    createdAt: sale.createdAt,
                  ),
                ),

                // Content
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      // Property Details Section (Title, Price, Location, RERA)
                      _buildPropertyDetailsSection(sale),

                      // Address Section
                      _buildAddressSection(sale),
                      const SizedBox(height: 16),
                      // Description Section
                      _buildDescriptionSection(sale),
                      const SizedBox(height: 16),

                      // Tab Navigation
                      _buildTabNavigation(sale, state),

                      // Tab Content based on selection
                      _buildSelectedSectionContent(sale, state),

                      const SizedBox(height: 24), // Space for bottom buttons
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomActionButtons(sale),
        );
      },
    );
  }

  Widget _buildPropertyDetailsSection(SaleRecord sale) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Price Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  (sale.projectName ?? 'Property Title').translate(context),
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Price Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.blueColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.blueColor.withOpacity(0.2)),
                ),
                child: Text(
                  sale.minPrice != null && sale.maxPrice != null
                      ? '${formatPrice(sale.minPrice)} - ${formatPrice(sale.maxPrice)}'
                      : sale.minPrice != null
                      ? '${formatPrice(sale.minPrice)}'
                      : '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.blueColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Zero Brokerage & Possession Date
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'Zero Brokerage',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.amber,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  (sale.propertyType?.toLowerCase().contains('openplot') ?? false)
                      ? 'Launched: ${sale.createdAt != null ? DateFormat('dd MMM yyyy').format(DateTime.parse(sale.createdAt!).toLocal()) : 'N/A'}'
                      : 'Possession: ${sale.possessionDate != null ? DateFormat('dd MMM yyyy').format(DateTime.parse(sale.possessionDate.toString()).toLocal()) : 'Ready to Move'}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // RERA Number Badge
          if (sale.reraNumber != null && sale.reraNumber!.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.06),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.verified_rounded,
                    size: 15,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'RERA No: ${sale.reraNumber}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTabNavigation(SaleRecord sale, SalesState state) {
    final l10n = AppLocalizations.of(context)!;
    int unitsCount = state.projectUnits?.items?.length ?? 0;

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildTabItem(l10n.overview),
              const SizedBox(width: 12),
              _buildTabItem(l10n.location),
              const SizedBox(width: 12),
              _buildTabItem(
                'Available ${_getUnitsLabel(sale.propertyType)}',
                '${l10n.available} ${_getUnitsLabel(sale.propertyType).translate(context)} ($unitsCount)',
              ),
              const SizedBox(width: 12),
              _buildTabItem(l10n.specifications),
              const SizedBox(width: 12),
              _buildTabItem(l10n.publicFacilities),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Divider(height: 1, thickness: 1, color: Colors.grey[200]),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildTabItem(String tabName, [String? tabLabel]) {
    final isSelected = _selectedSection == tabName;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSection = tabName;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.blueColor : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppTheme.blueColor : Colors.grey[300]!,
          ),
        ),
        child: Text(
          tabLabel ?? tabName,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedSectionContent(SaleRecord sale, SalesState state) {
    final l10n = AppLocalizations.of(context)!;
    if (_selectedSection == l10n.overview) {
      return _buildOverviewContent(sale);
    } else if (_selectedSection == l10n.location) {
      return _buildLocationContent(sale);
    } else if (_selectedSection ==
        'Available ${_getUnitsLabel(sale.propertyType)}') {
      return _buildAvailableFlatsContent(sale, state);
    } else if (_selectedSection == l10n.specifications) {
      return _buildSpecificationContent(sale);
    } else if (_selectedSection == l10n.publicFacilities) {
      return _buildPublicFacilitiesContent(sale);
    } else {
      return _buildOverviewContent(sale);
    }
  }

  Widget _buildOverviewContent(SaleRecord sale) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Info Cards (Type, Units, Area) - Above Description
          _buildPropertyInfoCards(sale),
          const SizedBox(height: 16),

          // Builder/Company Section
          _buildBuilderSection(sale),
          const SizedBox(height: 16),

          // Boost Now Button (only for owner)
          _buildBoostButton(sale),
        ],
      ),
    );
  }

  Widget _buildPropertyInfoCards(SaleRecord sale) {
    final l10n = AppLocalizations.of(context)!;
    final String unitsLabel = _getUnitsLabel(sale.propertyType).translate(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          _buildSpecificationItem(
            l10n.propertyType,
            (sale.propertyType ?? 'Property').translate(context),
          ),
          const Divider(),
          _buildSpecificationItem(unitsLabel, '${sale.noOfUnits ?? 0}'),
          const Divider(),
          _buildSpecificationItem(
            _getAreaLabel(sale.propertyType).translate(context),
            '${sale.area ?? 0} ${sale.areaUnit ?? "sqft"}',
          ),
        ],
      ),
    );
  }

  Widget _buildLocationContent(SaleRecord sale) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.location,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          if (sale.latitude != null &&
              sale.latitude != 0.0 &&
              sale.longitude != null &&
              sale.longitude != 0.0)
            StaticLocationMapView(
              latitude: sale.latitude!,
              longitude: sale.longitude!,
              locationName: sale.city,
            )
          else
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map, size: 48, color: Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      'Location not available',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildAvailableFlatsContent(SaleRecord sale, SalesState state) {
    final l10n = AppLocalizations.of(context)!;
    final String unitsLabel = _getUnitsLabel(sale.propertyType).translate(context);
    final bool isOwner =
        context.read<ProfileBloc>().state.userProfile?.id ==
        (sale.userId ?? sale.owner?.id);
    final units = state.projectUnits?.items ?? [];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isOwner)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${l10n.available} $unitsLabel (${units.length})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextButton.icon(
                  onPressed: () {
                    AddEditUnitBottomSheet.show(context, sale);
                  },
                  icon: const Icon(Icons.add, size: 20),
                  label: Text('Add'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.blueColor,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    backgroundColor: AppTheme.blueColor.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 16),
          if (state.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (units.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  '${l10n.noResultsFound} ${sale.propertyType?.toLowerCase().translate(context) ?? 'units'}',
                ),
              ),
            )
          else
            LayoutBuilder(
              builder: (context, constraints) {
                final double itemWidth = (constraints.maxWidth - 16) / 2;
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: units.map((unit) {
                    final String lowerPropType =
                        sale.propertyType?.toLowerCase().trim() ?? '';
                    final bool isApartment = lowerPropType.contains(
                      'apartment',
                    );
                    final bool isVilla = lowerPropType.contains('villa');
                    final bool isOpenPlot = lowerPropType.contains('plot');

                    String titleLabel = 'Unit';
                    if (isApartment) titleLabel = l10n.flats.replaceAll('లు', '');
                    if (isVilla) titleLabel = l10n.villa;
                    if (isOpenPlot) titleLabel = l10n.openPlot;

                    final isAvailable =
                        (unit.status ?? "Available").toLowerCase() ==
                        'available';

                    return SizedBox(
                      width: itemWidth,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '$titleLabel No. ${unit.unitNumber ?? "N/A"}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (isOwner)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          AddEditUnitBottomSheet.show(
                                            context,
                                            sale,
                                            unit,
                                          );
                                        },
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: AppTheme.blueColor,
                                          size: 18,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      InkWell(
                                        onTap: () {
                                          if (unit.id != null) {
                                            _showDeleteUnitDialog(
                                              context,
                                              unit,
                                              sale.id!,
                                            );
                                          }
                                        },
                                        child: const Icon(
                                          Icons.delete_outline,
                                          color: Colors.red,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: isAvailable
                                    ? Colors.green[50]
                                    : Colors.red[50],
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: isAvailable
                                      ? Colors.green[200]!
                                      : Colors.red[200]!,
                                ),
                              ),
                              child: Text(
                                isAvailable ? l10n.available : 'Sold Out',
                                style: TextStyle(
                                  color: isAvailable
                                      ? Colors.green[700]
                                      : Colors.red[700],
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              formatPrice(unit.price),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppTheme.blueColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildUnitDetailIconRow(
                              Icons.square_foot,
                              '${unit.area ?? 0} ${unit.measurement ?? "SqFts"}',
                            ),
                            if (isApartment && unit.floor != null)
                              _buildUnitDetailIconRow(
                                Icons.layers_outlined,
                                '${l10n.noOfFloors.replaceAll('ల సంఖ్య', '')} ${unit.floor}',
                              ),
                            if (isApartment && unit.bhkQty != null)
                              _buildUnitDetailIconRow(
                                Icons.king_bed_outlined,
                                '${unit.bhkQty} BHK',
                              ),
                            if (unit.facing != null)
                              _buildUnitDetailIconRow(
                                Icons.explore_outlined,
                                '${unit.facing} Facing',
                              ),
                            if (isVilla && unit.villaType != null)
                              _buildUnitDetailIconRow(
                                Icons.home_outlined,
                                '${unit.villaType}',
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildUnitDetailIconRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: Colors.grey[600]),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text.translate(context),
              style: TextStyle(color: Colors.grey[700], fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationContent(SaleRecord sale) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.specifications,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          if (sale.specifications != null &&
              sale.specifications!.trim().isNotEmpty)
            _buildBulletedList(sale.specifications!)
          else
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: const Center(
                child: Text(
                  'No specifications available',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPublicFacilitiesContent(SaleRecord sale) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.publicFacilities,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          if (sale.publicFacilities != null &&
              sale.publicFacilities!.trim().isNotEmpty)
            _buildBulletedList(sale.publicFacilities!)
          else
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: const Center(
                child: Text(
                  'No public facilities information available',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  IconData _getAmenityIcon(String item) {
    final lower = item.toLowerCase();
    if (lower.contains('pool') || lower.contains('swimming')) return Icons.pool;
    if (lower.contains('gym') || lower.contains('fitness') || lower.contains('workout')) return Icons.fitness_center;
    if (lower.contains('banquet') || lower.contains('hall') || lower.contains('party')) return Icons.celebration;
    if (lower.contains('play') || lower.contains('ground') || lower.contains('kids') || lower.contains('park')) return Icons.sports_soccer;
    if (lower.contains('walk') || lower.contains('jog') || lower.contains('track') || lower.contains('are')) return Icons.directions_walk;
    if (lower.contains('guest') || lower.contains('room')) return Icons.hotel;
    if (lower.contains('parking') || lower.contains('car')) return Icons.local_parking;
    if (lower.contains('security') || lower.contains('guard')) return Icons.security;
    if (lower.contains('lift') || lower.contains('elevator')) return Icons.elevator;
    if (lower.contains('power') || lower.contains('backup')) return Icons.bolt;
    if (lower.contains('water') || lower.contains('supply')) return Icons.water_drop;
    if (lower.contains('club') || lower.contains('house')) return Icons.house;
    return Icons.check_circle_outline;
  }

  Widget _buildBulletedList(String text) {
    final List<String> items = text
        .split(RegExp(r';;|\n'))
        .map((s) => s.trim().replaceAll(RegExp(r'^•\s*'), ''))
        .where((s) => s.isNotEmpty)
        .toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        String correctedItem = item;
        if (correctedItem.toLowerCase() == 'walking are') {
          correctedItem = 'Walking Area';
        }
        final cleanItem = correctedItem.toTitleCase();
        final icon = _getAmenityIcon(item);

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.blueColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 18, color: AppTheme.blueColor),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  cleanItem.translate(context),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDescriptionSection(SaleRecord sale) {
    final l10n = AppLocalizations.of(context)!;
    final description = (sale.description ?? '').translate(context);
    if (description.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (context, constraints) {
              final textSpan = TextSpan(
                text: description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              );
              final textPainter = TextPainter(
                text: textSpan,
                maxLines: 3,
                textDirection: Directionality.of(context),
              );
              textPainter.layout(maxWidth: constraints.maxWidth);
              final bool isExceeding = textPainter.didExceedMaxLines;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    maxLines: _isDescriptionExpanded ? null : 3,
                    overflow: _isDescriptionExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  if (isExceeding) ...[
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDescriptionExpanded = !_isDescriptionExpanded;
                        });
                      },
                      child: Text(
                        _isDescriptionExpanded ? l10n.less : l10n.more,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection(SaleRecord sale) {
    final city = sale.city?.trim();
    final state = sale.state?.trim();

    List<String> addressParts = [];
    if (city != null && city.isNotEmpty) {
      addressParts.add(city.replaceAll(',', ' |'));
    }
    if (state != null && state.isNotEmpty) {
      addressParts.add(state);
    }

    if (addressParts.isEmpty) {
      if (sale.address != null && sale.address!.trim().isNotEmpty) {
        addressParts.add(sale.address!.trim());
      } else if (sale.location != null && sale.location!.trim().isNotEmpty) {
        addressParts.add(sale.location!.trim());
      }
    }

    String addressText = addressParts.map((p) => p.translate(context)).join(' | ');

    addressText = addressText
        .replaceAll(RegExp(r'\s*\|\s*'), ' | ')
        .replaceAll(RegExp(r'^[|, \s]+|[|, \s]+$'), '')
        .trim();

    if (addressText.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 14, color: Colors.grey.shade700),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  addressText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBuilderSection(SaleRecord sale) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<CompanyBloc, CompanyState>(
      builder: (context, companyState) {
        final company = companyState.userCompany;
        final bool hasCompany = company != null;

        final String? imageUrl = hasCompany
            ? company.imageUrl
            : sale.owner?.profilepic;
        final String name = hasCompany
            ? (company.companyName ?? 'Company')
            : () {
                final owner = sale.owner;
                if (owner == null) return 'Propertify User';
                final firstName = owner.firstName?.trim() ?? '';
                final lastName = owner.lastName?.trim() ?? '';
                if (firstName.isNotEmpty || lastName.isNotEmpty) {
                  return '$firstName $lastName'.trim();
                }
                return owner.username ?? 'Propertify User';
              }();
        final String subTitle = hasCompany
            ? (company.category ?? 'Real Estate').translate(context)
            : (sale.owner?.email ?? '');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.postedBy,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                final userId = sale.userId ?? sale.owner?.id;
                if (userId != null) {
                  if (hasCompany &&
                      company.gstVerificationStatus == 'approved') {
                    context.push(MyCompanyScreen.routeName, extra: userId);
                  } else {
                    context.push(
                      OtherUserProfileScreen.routeName,
                      extra: userId,
                    );
                  }
                } else {
                  CustomToast.showErrorToast(msg: 'User ID not found');
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: imageUrl != null && imageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: imageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey.shade200,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const LogoPlaceholder(width: 60, height: 60),
                            )
                          : const LogoPlaceholder(width: 60, height: 60),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name.toTitleCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          if (subTitle.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              subTitle,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBoostButton(SaleRecord sale) {
    return context.read<ProfileBloc>().state.userProfile?.id == sale.owner?.id
        ? Center(
            child: GestureDetector(
              onTap: () {
                final saleId = sale.id ?? '';
                context.push(
                  '${SelectPlanScreen.routeName}?contentType=${ContentType.SALES.value}&contentId=$saleId',
                );
              },
              child: SvgPicture.asset('assets/images/boost_post.svg'),
            ),
          )
        : Container();
  }

  Widget _buildBottomActionButtons(SaleRecord sale) {
    final l10n = AppLocalizations.of(context)!;
    final bool isOwner =
        context.read<ProfileBloc>().state.userProfile?.id ==
        (sale.userId ?? sale.owner?.id);

    final bool hasBrochure =
        sale.brochureUrl != null && sale.brochureUrl!.trim().isNotEmpty;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            if (hasBrochure) ...[
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    final url = sale.brochureUrl!.trim();
                    FullscreenWidget.open(context, imageUrl: url);
                  },
                  icon: const Icon(Icons.description, size: 20),
                  label: const Text('Brochure'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.blueColor,
                    side: BorderSide(color: AppTheme.blueColor),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],

            Expanded(
              child: isOwner
                  ? ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: context.read<SalesBloc>(),
                              child: SaleCallbackRequestsScreen(
                                projectId: sale.id!,
                                projectName: sale.projectName ?? 'Project',
                              ),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.notifications_outlined, size: 20),
                      label: Text(l10n.requests),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.blueColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )
                  : ElevatedButton.icon(
                      onPressed: () {
                        if (context.read<HomeBloc>().state.showAddButton) {
                          if (sale.id != null) {
                            context.read<SalesBloc>().add(
                              SalesEvent.requestCallback(
                                salesProjectId: sale.id!,
                              ),
                            );
                          }
                        } else {
                          context.push(AuthScreen.routeName);
                        }
                      },
                      icon: const Icon(Icons.phone, size: 20),
                      label: Text(l10n.call),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.blueColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(num? price) {
    if (price == null) return '0';
    if (price == 0) return '0';

    if (price >= 100000) {
      double priceInLakhs = price / 100000;
      if (priceInLakhs == priceInLakhs.roundToDouble()) {
        return '${priceInLakhs.round()}';
      } else {
        return priceInLakhs.toStringAsFixed(1);
      }
    }

    return price.toString();
  }

  String _getUnitsLabel(String? propertyType) {
    final type = propertyType?.toLowerCase().trim() ?? '';
    if (type.contains('apartment')) {
      return 'Apartments';
    } else if (type.contains('villa')) {
      return 'Villas';
    } else if (type.contains('plot')) {
      return 'Plots';
    }
    return 'Units';
  }

  String _getAreaLabel(String? propertyType) {
    final type = propertyType?.toLowerCase().trim() ?? '';
    if (type.contains('plot')) {
      return 'Total Project Area';
    }
    return 'Total Built-up Area';
  }
}
