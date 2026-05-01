import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:propertify/core/content_type.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/utils/common_widgets/select_plan_screen.dart';
import 'package:propertify/utils/extensions/price_format.dart';
import '../../feed/presentation/widgets/image_carousel.dart';
import '../models/sales_model.dart';
import '../../../core/app_theme.dart';
import 'package:propertify/utils/fullscreenwidget.dart';
import '../../../utils/custom_toast.dart';
import '../../../utils/string_extensions.dart';
import '../bloc/sales_bloc.dart';

import 'widgets/static_location_map_view.dart';
import '../../company/bloc/company_bloc.dart';
import '../../company/presentation/my_company.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';
import 'widgets/add_edit_unit_bottom_sheet.dart';
import 'sale_callback_requests_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesBloc, SalesState>(
      listener: (context, state) {
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
            title: const Text(
              'Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
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
                  onPressed: () {
                    // Handle share functionality
                  },
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
                  height: 340,
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
                      // Property Details Section (Title, Price, Location, RERA)
                      _buildPropertyDetailsSection(sale),

                      // Tab Navigation
                      _buildTabNavigation(sale, state),

                      // Tab Content based on selection
                      _buildSelectedSectionContent(sale, state),

                      const SizedBox(height: 100), // Space for bottom buttons
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
          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  (sale.projectName ?? 'Property Title').toTitleCase(),
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              // Price
              Text(
                sale.minPrice != null && sale.maxPrice != null
                    ? '${formatPrice(sale.minPrice)}-${formatPrice(sale.maxPrice)}'
                    : sale.minPrice != null
                    ? '${formatPrice(sale.minPrice)}'
                    : '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.blueColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Zero Brokerage & Possession Date
          Text(
            'Zero Brokerage • ${(sale.propertyType?.toLowerCase().contains('openplot') ?? false) ? 'Launched Date: ${sale.createdAt != null ? DateFormat('dd MMM yyyy').format(DateTime.parse(sale.createdAt!).toLocal()) : 'N/A'}' : 'Possession by: ${sale.possessionDate != null ? DateFormat('dd MMM yyyy').format(DateTime.parse(sale.possessionDate.toString()).toLocal()) : 'Ready to Move'}'}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              // color: Colors.grey,
            ),
          ),

          const SizedBox(height: 12),

          // Location
          // Row(
          //   children: [
          //     const Icon(
          //       Icons.location_on_outlined,
          //       size: 16,
          //       color: Colors.grey,
          //     ),
          //     const SizedBox(width: 4),
          //     Expanded(
          //       child: Text(
          //         (sale.location ?? sale.city ?? 'Location').toTitleCase(),
          //         style: const TextStyle(fontSize: 13, color: Colors.grey),
          //         maxLines: 1,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ),
          //   ],
          // ),

          // const SizedBox(height: 8),

          // RERA Number
          if (sale.reraNumber != null && sale.reraNumber!.isNotEmpty)
            Row(
              children: [
                const Icon(
                  Icons.verified_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  'Rera no : ${sale.reraNumber}',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTabNavigation(SaleRecord sale, SalesState state) {
    int unitsCount = state.projectUnits?.items?.length ?? 0;

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildTabItem('Overview'),
              const SizedBox(width: 20),
              _buildTabItem('Location'),
              const SizedBox(width: 20),
              _buildTabItem(
                'Available ${_getUnitsLabel(sale.propertyType)}',
                'Available ${_getUnitsLabel(sale.propertyType)} ($unitsCount)',
              ),
              const SizedBox(width: 20),
              _buildTabItem('Specification'),
              const SizedBox(width: 20),
              _buildTabItem('Public Facilities'),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Divider(height: 1, thickness: 1, color: Colors.grey[200]),
        const SizedBox(height: 8),
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
      child: Column(
        children: [
          Text(
            tabLabel ?? tabName,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? AppTheme.blueColor : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 40,
            color: isSelected ? AppTheme.blueColor : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedSectionContent(SaleRecord sale, SalesState state) {
    if (_selectedSection == 'Overview') {
      return _buildOverviewContent(sale);
    } else if (_selectedSection == 'Location') {
      return _buildLocationContent(sale);
    } else if (_selectedSection ==
        'Available ${_getUnitsLabel(sale.propertyType)}') {
      return _buildAvailableFlatsContent(sale, state);
    } else if (_selectedSection == 'Specification') {
      return _buildSpecificationContent(sale);
    } else if (_selectedSection == 'Public Facilities') {
      return _buildPublicFacilitiesContent(sale);
    } else {
      return _buildOverviewContent(sale);
    }
  }

  Widget _buildOverviewContent(SaleRecord sale) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Info Cards (Type, Units, Area) - Above Description
          _buildPropertyInfoCards(sale),
          const SizedBox(height: 24),

          // Description Section
          _buildDescriptionSection(sale),
          const SizedBox(height: 24),

          // Address Section
          _buildAddressSection(sale),
          const SizedBox(height: 24),

          // Builder/Company Section
          _buildBuilderSection(sale),
          const SizedBox(height: 16),

          // Boost Now Button (only for owner)
          _buildBoostButton(sale),
          // const SizedBox(height: 100), // Space for bottom buttons
        ],
      ),
    );
  }

  Widget _buildPropertyInfoCards(SaleRecord sale) {
    final String unitsLabel = _getUnitsLabel(sale.propertyType);

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
            'Property Type',
            (sale.propertyType ?? 'Property').toTitleCase(),
          ),
          const Divider(),
          _buildSpecificationItem(unitsLabel, '${sale.noOfUnits ?? 0}'),
          const Divider(),
          _buildSpecificationItem(
            _getAreaLabel(sale.propertyType),
            '${sale.area ?? 0} ${sale.areaUnit ?? "sqft"}',
          ),
        ],
      ),
    );
  }

  Widget _buildLocationContent(SaleRecord sale) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // Map View
          if (sale.latitude != null && sale.longitude != null)
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

          const SizedBox(height: 100), // Space for bottom buttons
        ],
      ),
    );
  }

  Widget _buildAvailableFlatsContent(SaleRecord sale, SalesState state) {
    final String unitsLabel = _getUnitsLabel(sale.propertyType);
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
                  'Available $unitsLabel (${units.length})',
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
                  label: Text('Add $unitsLabel'),
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
                  'No available ${sale.propertyType?.toLowerCase() ?? 'units'}',
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
                    if (isApartment) titleLabel = 'Flat';
                    if (isVilla) titleLabel = 'Villa';
                    if (isOpenPlot) titleLabel = 'Plot';

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
                                isAvailable ? 'Available' : 'Sold Out',
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
                                'Floor ${unit.floor}',
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
              text,
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Specifications',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // Display specifications if available
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

          const SizedBox(height: 100), // Space for bottom buttons
        ],
      ),
    );
  }

  Widget _buildPublicFacilitiesContent(SaleRecord sale) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Public Facilities',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // Display public facilities if available
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

          const SizedBox(height: 100), // Space for bottom buttons
        ],
      ),
    );
  }

  Widget _buildBulletedList(String text) {
    // Also split by newline if legacy texts use it
    final List<String> items = text
        .split(RegExp(r';;|\n'))
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 18,
                color: AppTheme.blueColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.replaceFirst(
                    RegExp(r'^•\s*'),
                    '',
                  ), // Strip old bullets if present
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDescriptionSection(SaleRecord sale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          (sale.description?.length ?? 0) > 150
              ? (_isDescriptionExpanded
                    ? (sale.description ?? '').capitalize()
                    : '${(sale.description?.length ?? 0) > 150 ? sale.description!.substring(0, 150).capitalize() : (sale.description ?? '').capitalize()}${(sale.description?.length ?? 0) > 150 ? '...' : ''}')
              : (sale.description ?? '').capitalize(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        if ((sale.description?.length ?? 0) > 150)
          GestureDetector(
            onTap: () {
              setState(() {
                _isDescriptionExpanded = !_isDescriptionExpanded;
              });
            },
            child: Text(
              _isDescriptionExpanded ? 'Read less' : 'Read more',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.blueColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 8),
                  Text(
                    "${sale.city?.replaceAll(',', ' |') ?? ''} | ${sale.state ?? ''}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBuilderSection(SaleRecord sale) {
    return BlocBuilder<CompanyBloc, CompanyState>(
      builder: (context, companyState) {
        final company = companyState.userCompany;
        final bool hasCompany = company != null;

        final String? imageUrl = hasCompany
            ? company.imageUrl
            : sale.owner?.profilepic;
        final String name = hasCompany
            ? (company.companyName ?? 'Company')
            : (sale.owner?.username ?? 'Propertify User');
        final String subTitle = hasCompany
            ? (company.category ?? 'Real Estate')
            : (sale.owner?.email ?? '');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Posted By',
              style: TextStyle(
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
                  context.push(MyCompanyScreen.routeName, extra: userId);
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
                // Navigate to SelectPlanScreen when boost is tapped
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
    final bool isOwner =
        context.read<ProfileBloc>().state.userProfile?.id ==
        (sale.userId ?? sale.owner?.id);

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
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  final url = sale.brochureUrl?.trim();
                  String? openUrl = url != null && url.isNotEmpty
                      ? url
                      : (sale.imageUrls != null && sale.imageUrls!.isNotEmpty
                            ? sale.imageUrls!.first
                            : null);
                  if (openUrl != null) {
                    FullscreenWidget.open(context, imageUrl: openUrl);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No brochure available')),
                    );
                  }
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

            // Owner → View Requests; Others → Call Request / Auth
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
                      label: const Text('View Requests'),
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
                      label: const Text('Call Request'),
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

    // Convert to lakhs for display (the "Lakh" suffix is added in the UI)
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
      return 'Flats';
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
