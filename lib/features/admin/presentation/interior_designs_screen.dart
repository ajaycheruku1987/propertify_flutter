import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/notify_message.dart';
import '../../../utils/custom_toast.dart';
import '../bloc/admin_bloc.dart';

class InteriorDesignsScreen extends StatefulWidget {
  static const String routeName = '/interior-designs-screen';
  const InteriorDesignsScreen({super.key});

  @override
  State<InteriorDesignsScreen> createState() => _InteriorDesignsScreenState();
}

class _InteriorDesignsScreenState extends State<InteriorDesignsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<AdminBloc>().add(const AdminEvent.getInteriorDesigns());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final state = context.read<AdminBloc>().state;
      if (!state.isLoading && state.hasMoreInteriorDesigns) {
        context.read<AdminBloc>().add(
              AdminEvent.getInteriorDesigns(
                page: state.currentInteriorDesignsPage + 1,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {
        if (state.notifyStatus != null) {
          if (state.notifyStatus!.type == NotifyType.error) {
            CustomToast.showErrorToast(msg: state.notifyStatus?.message);
          } else {
            CustomToast.showSuccessToast(msg: state.notifyStatus?.message);
          }
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: state.isLoading && state.interiorDesigns == null,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  Expanded(
                    child: state.interiorDesigns == null ||
                            state.interiorDesigns!.isEmpty
                        ? _buildEmptyState()
                        : _buildTable(state.interiorDesigns!),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
              color: Colors.black87,
            ),
            const Expanded(
              child: Text(
                'Interior Designs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 48), // Balance the back button
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.design_services_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No interior designs found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTable(List interiorDesigns) {
    final theme = Theme.of(context);
    
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(
            theme.primaryColor.withOpacity(0.1),
          ),
          columns: const [
            DataColumn(
              label: Text(
                'Title',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6941C6),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Budget Price',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6941C6),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'address',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6941C6),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Posted by',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6941C6),
                ),
              ),
            ),
          ],
          rows: interiorDesigns.map((design) {
            return DataRow(
              cells: [
                DataCell(Text(design.title ?? 'Interior')),
                DataCell(Text(design.budgetPrice ?? '7000')),
                DataCell(Text(design.address ?? 'Dummy text')),
                DataCell(Text(design.postedBy ?? 'Rajesh')),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
