import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/sales/presentation/sale_view_screen.dart';
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
    return BlocBuilder<SalesBloc, SalesState>(
      builder: (context, state) {
        if ((state.salesList?.salerecords ?? []).isEmpty && state.isLoading) {
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
        } else if ((state.salesList?.salerecords ?? []).isEmpty) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
              ),
              const SliverFillRemaining(
                child: Center(child: Text('No sales available')),
              ),
            ],
          );
        }

        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SalesTile(
                      sale: state.salesList!.salerecords![index],
                      onTap: () {
                        final saleId = state.salesList!.salerecords![index].id;
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
  }
}
