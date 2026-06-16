import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/features/company/presentation/gst_verification_screen.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/sales/presentation/sale_view_screen.dart';
import 'package:propertify/features/home/presentation/widgets/home_loan_widget.dart';
import '../../bloc/sales_bloc.dart';
import '../../models/sales_model.dart';
import 'sales_tile.dart';
import 'dart:async';

class SalesListWidget extends StatefulWidget {
  const SalesListWidget({Key? key}) : super(key: key);

  @override
  State<SalesListWidget> createState() => _SalesListWidgetState();
}

class _SalesListWidgetState extends State<SalesListWidget> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _loadSales();
  }

  void _loadSales() {
    context.read<SalesBloc>().add(
      SalesEvent.getSalesEvent(offset: 0, limit: 10),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newController = PrimaryScrollController.of(context);
    if (_scrollController != newController) {
      _scrollController?.removeListener(_onScroll);
      _scrollController = newController;
      _scrollController!.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final controller = _scrollController;
    if (controller == null || !controller.hasClients) return;
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - 300) {
      final state = context.read<SalesBloc>().state;
      if (!state.isLoading && state.hasMoreData) {
        context.read<SalesBloc>().add(
          SalesEvent.getSalesEvent(
            offset: state.currentOffset,
            limit: 10,
          ),
        );
      }
    }
  }

  Future<void> _onRefresh() async {
    final homeState = context.read<HomeBloc>().state;
    final filterData = homeState.activeSalesFilter;

    String? location;
    String? propertyType;
    double? minPrice;
    double? maxPrice;
    String? search;

    if (filterData != null) {
      location = filterData['location'] as String?;
      
      final propertyTypes = filterData['propertyTypes'] as List?;
      propertyType = propertyTypes != null &&
              propertyTypes.isNotEmpty &&
              !propertyTypes.contains('All')
          ? propertyTypes.first as String?
          : null;

      final priceRange = filterData['priceRange'] as Map?;
      minPrice = priceRange != null
          ? (priceRange['min'] as num).toDouble() * 100000
          : null;
      maxPrice = priceRange != null
          ? (priceRange['max'] as num).toDouble() * 100000
          : null;

      search = filterData['search'] as String?;
    }

    final salesBloc = context.read<SalesBloc>();
    final completer = Completer<void>();
    final subscription = salesBloc.stream.listen((state) {
      if (!state.isLoading) {
        if (!completer.isCompleted) completer.complete();
      }
    });

    salesBloc.add(
      SalesEvent.getSalesEvent(
        offset: 0,
        limit: 10,
        location: location,
        propertyType: propertyType,
        minPrice: minPrice,
        maxPrice: maxPrice,
        search: search,
      ),
    );

    await Future.any([
      completer.future,
      Future.delayed(const Duration(seconds: 5)),
    ]);
    await subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyBloc, CompanyState>(
      builder: (context, companyState) {
        final homeState = context.watch<HomeBloc>().state;
        return BlocBuilder<SalesBloc, SalesState>(
          builder: (context, state) {
            final Widget content;
            if ((state.salesList?.salerecords ?? []).isEmpty &&
                state.isLoading) {
              content = CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  if (homeState.activeSalesFilter != null)
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _StickyChipHeaderDelegate(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildActiveFilterChips(context, homeState),
                        ),
                        height: 52.0,
                      ),
                    ),
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
              );
            } else if (state.isError &&
                (state.salesList?.salerecords ?? []).isEmpty) {
              content = CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  if (homeState.activeSalesFilter != null)
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _StickyChipHeaderDelegate(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildActiveFilterChips(context, homeState),
                        ),
                        height: 52.0,
                      ),
                    ),
                  SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'Error: ${state.notifyStatus?.message ?? "Unknown error"}',
                      ),
                    ),
                  ),
                ],
              );
            } else {
              content = CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  if (homeState.activeSalesFilter != null)
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _StickyChipHeaderDelegate(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildActiveFilterChips(context, homeState),
                        ),
                        height: 52.0,
                      ),
                    ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // Verification Pending Banner
                        if (homeState.showAddButton &&
                            companyState.myCompany != null &&
                            companyState.myCompany?.gstVerificationStatus ==
                                'pending') ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                        // Verify GST Banner (when company exists but not verified)
                        if (homeState.showAddButton &&
                            companyState.myCompany != null &&
                            (companyState.myCompany?.gstVerificationStatus ==
                                    'none' ||
                                companyState.myCompany?.gstVerificationStatus ==
                                    'rejected' ||
                                companyState.myCompany?.gstVerificationStatus ==
                                    null)) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: GestureDetector(
                              onTap: () {
                                context.push(
                                  '/verification-payment?type=gst&entityId=${companyState.myCompany?.id}&showSkip=false',
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(
                                        context,
                                      ).primaryColor.withOpacity(0.1),
                                      Theme.of(
                                        context,
                                      ).primaryColor.withOpacity(0.05),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Theme.of(
                                          context,
                                        ).primaryColor.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.verified_user,
                                        color: Theme.of(context).primaryColor,
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Verify GST',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            'Verify GST to start creating projects',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],

                        if (homeState.showAddButton &&
                            companyState.myCompany == null) ...[
                          AdSliderWidget(
                            title: 'Want to create a Project!',
                            caption: 'First Create a company by Verifying GST',
                            onCreateRequest: () {
                              context.push(GstVerificationScreen.routeName);
                            },
                            createButtonText: 'Create Company',
                            showExploreDetailsButton: false,
                            backgroundImagePath:
                                'assets/images/create_company_banner.svg',
                          ),
                        ],
                      ],
                    ),
                  ),
                  if ((state.salesList?.salerecords ?? []).isEmpty)
                    const SliverFillRemaining(
                      child: Center(child: Text('No sales available')),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SalesTile(
                              sale: state.salesList!.salerecords![index],
                              onTap: () {
                                final saleId =
                                    state.salesList!.salerecords![index].id;
                                final minimalSale = SaleRecord(id: saleId);
                                context.push(
                                  SaleViewScreen.routeName,
                                  extra: minimalSale,
                                );
                              },
                            ),
                          );
                        }, childCount: (state.salesList?.salerecords ?? []).length),
                      ),
                    ),
                  if (state.isLoading && (state.salesList?.salerecords ?? []).isNotEmpty)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                ],
              );
            }
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: content,
            );
          },
        );
      },
    );
  }

  void _applySalesFilter(BuildContext context, Map<String, dynamic> filterData) {
    final propertyTypes = filterData['propertyTypes'] as List?;
    final priceRange = filterData['priceRange'] as Map?;
    final isLocationCustom = filterData['isLocationCustom'] == true;

    final isDefault =
        (propertyTypes == null ||
            propertyTypes.isEmpty ||
            propertyTypes.contains('All')) &&
        (priceRange == null ||
            (priceRange['min'] == 10 && priceRange['max'] == 1000)) &&
        !isLocationCustom;

    if (isDefault) {
      context.read<HomeBloc>().add(const HomeEvent.updateSalesFilter(null));
      context.read<SalesBloc>().add(const SalesEvent.getSalesEvent());
    } else {
      context.read<HomeBloc>().add(HomeEvent.updateSalesFilter(filterData));

      final propertyType =
          propertyTypes != null &&
              propertyTypes.isNotEmpty &&
              !propertyTypes.contains('All')
          ? propertyTypes.first as String?
          : null;

      final minPrice = priceRange != null
          ? (priceRange['min'] as num).toDouble() * 100000
          : null;
      final maxPrice = priceRange != null
          ? (priceRange['max'] as num).toDouble() * 100000
          : null;

      context.read<SalesBloc>().add(
        SalesEvent.getSalesEvent(
          location: filterData['location'] as String?,
          propertyType: propertyType,
          minPrice: minPrice,
          maxPrice: maxPrice,
          search: filterData['search'] as String?,
        ),
      );
    }
  }

  Widget _buildActiveFilterChips(BuildContext context, HomeState state) {
    if (state.activeSalesFilter == null) return const SizedBox.shrink();

    final filter = state.activeSalesFilter!;
    final chips = <Widget>[];

    if (filter['isLocationCustom'] == true && filter['address'] != null) {
      chips.add(
        _buildChip('Location: ${filter['address']}', () {
          final newFilter = Map<String, dynamic>.from(filter);
          newFilter['isLocationCustom'] = false;
          newFilter['location'] = null;
          newFilter['address'] = null;
          _applySalesFilter(context, newFilter);
        }),
      );
    }
    final propertyTypes = filter['propertyTypes'] as List?;
    if (propertyTypes != null &&
        propertyTypes.isNotEmpty &&
        !propertyTypes.contains('All')) {
      for (final type in propertyTypes) {
        chips.add(
          _buildChip('Type: $type', () {
            final newFilter = Map<String, dynamic>.from(filter);
            final list = List<String>.from(newFilter['propertyTypes'] ?? []);
            list.remove(type);
            newFilter['propertyTypes'] = list;
            _applySalesFilter(context, newFilter);
          }),
        );
      }
    }
    final priceRange = filter['priceRange'] as Map?;
    if (priceRange != null &&
        (priceRange['min'] != 10 || priceRange['max'] != 1000)) {
      chips.add(
        _buildChip(
          'Price: ₹${(priceRange['min'] as num).round()}L - ₹${(priceRange['max'] as num).round()}L',
          () {
            final newFilter = Map<String, dynamic>.from(filter);
            newFilter['priceRange'] = {'min': 10, 'max': 1000};
            _applySalesFilter(context, newFilter);
          },
        ),
      );
    }

    if (chips.isEmpty) return const SizedBox.shrink();

    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        itemBuilder: (context, index) => chips[index],
      ),
    );
  }

  Widget _buildChip(String label, VoidCallback onRemove) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close, size: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _StickyChipHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _StickyChipHeaderDelegate({required this.child, this.height = 52.0});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      height: height,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant _StickyChipHeaderDelegate oldDelegate) {
    return oldDelegate.child != child || oldDelegate.height != height;
  }
}
