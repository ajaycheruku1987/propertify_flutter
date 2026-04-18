import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/services/models/services_response_model.dart';

import '../../../core/notify_message.dart';
import '../../../utils/custom_toast.dart';
import '../bloc/admin_bloc.dart';
import 'widgets/services_verification_request_card.dart';

class ServicesVerificationRequests extends StatefulWidget {
  static const String routeName = '/services-verification-requests';
  const ServicesVerificationRequests({super.key});

  @override
  State<ServicesVerificationRequests> createState() =>
      _ServicesVerificationRequestsState();
}

class _ServicesVerificationRequestsState
    extends State<ServicesVerificationRequests> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<AdminBloc>().add(const AdminEvent.getServices(limit: 100));
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
      if (!state.isLoading && state.hasMoreServices) {
        context.read<AdminBloc>().add(
          AdminEvent.getServices(
            page: state.currentServicesPage + 1,
            limit: 100,
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
        final services = state.services;
        return BlurryModalProgressHUD(
          inAsyncCall: state.isLoading && services == null,
          child: Scaffold(
            backgroundColor: const Color(0xFFF9F9FF),
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  Expanded(
                    child: services == null || services.isEmpty
                        ? (state.isLoading
                              ? const SizedBox()
                              : _buildEmptyState())
                        : _buildServicesList(services, state.hasMoreServices),
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
      decoration: const BoxDecoration(color: Color(0xFFF3EFFF)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
              color: Colors.black87,
            ),
            const Expanded(
              child: Text(
                'Verification Requests',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            const SizedBox(width: 48),
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
            Icons.verified_user_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No services found for verification',
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

  Widget _buildServicesList(
    List<ServicesResponseModel> services,
    bool hasMore,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<AdminBloc>().add(const AdminEvent.getServices());
      },
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: services.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == services.length) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final service = services[index];
          if (service.aadharCardImageUrl == null) {
            return const SizedBox();
          }
          return ServicesVerificationRequestCard(
            service: service,
            onStatusUpdate: (status) =>
                _handleUpdateStatus(service.id ?? '', status),
          );
        },
      ),
    );
  }

  void _handleUpdateStatus(String serviceId, String status) {
    context.read<AdminBloc>().add(
      AdminEvent.verifyService(
        serviceId: serviceId,
        isVerified: status == 'approved',
      ),
    );
  }
}
