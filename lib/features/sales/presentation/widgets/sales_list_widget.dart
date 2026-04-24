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

class SalesListWidget extends StatefulWidget {
  const SalesListWidget({Key? key}) : super(key: key);

  @override
  State<SalesListWidget> createState() => _SalesListWidgetState();
}

class _SalesListWidgetState extends State<SalesListWidget> {
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
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyBloc, CompanyState>(
      builder: (context, companyState) {
        final homeState = context.watch<HomeBloc>().state;
        return BlocBuilder<SalesBloc, SalesState>(
          builder: (context, state) {
            if ((state.salesList?.salerecords ?? []).isEmpty &&
                state.isLoading) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
              );
            } else if (state.isError &&
                (state.salesList?.salerecords ?? []).isEmpty) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
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
            }

            return CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context,
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
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.av_timer_rounded,
                                    color: Colors.orange,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Verification in progress',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Usually takes 24 hours',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
              ],
            );
          },
        );
      },
    );
  }
}
