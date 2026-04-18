import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/admin/models/admin_companies_response_model.dart';
import 'package:propertify/features/company/presentation/my_company.dart';
import 'package:propertify/utils/string_extensions.dart';

import '../../../core/notify_message.dart';
import '../../../utils/custom_toast.dart';
import '../bloc/admin_bloc.dart';
import 'package:intl/intl.dart';
import '../../../utils/common_widgets/logo_placeholder.dart';

class GstVerificationRequestsScreen extends StatefulWidget {
  static const String routeName = '/admin-gst-verification-requests';

  const GstVerificationRequestsScreen({super.key});

  @override
  State<GstVerificationRequestsScreen> createState() =>
      _GstVerificationRequestsScreenState();
}

class _GstVerificationRequestsScreenState
    extends State<GstVerificationRequestsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<AdminBloc>().add(const AdminEvent.getGstPendingCompanies());
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
      if (!state.isLoading && state.hasMoreGstPending) {
        context.read<AdminBloc>().add(
          AdminEvent.getGstPendingCompanies(
            page: state.currentGstPendingPage + 1,
            limit: 30,
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
          inAsyncCall: state.isLoading && state.gstPendingCompanies == null,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  Expanded(
                    child:
                        state.gstPendingCompanies == null ||
                            state.gstPendingCompanies!.isEmpty
                        ? _buildEmptyState()
                        : _buildVerificationList(state.gstPendingCompanies!),
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
                'GST Verification Requests',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
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
            'No pending GST verifications',
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

  Widget _buildVerificationList(List<AdminCompanyModel> companies) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: companies.length,
      itemBuilder: (context, index) {
        final company = companies[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: AdminGstCompanyCard(company: company),
        );
      },
    );
  }
}

class AdminGstCompanyCard extends StatelessWidget {
  final AdminCompanyModel company;

  const AdminGstCompanyCard({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String formattedDate = '';

    if (company.createdAt != null) {
      try {
        final date = DateTime.parse(company.createdAt!);
        formattedDate = DateFormat('MMM d, yyyy').format(date);
      } catch (e) {
        formattedDate = '';
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () =>
            context.push(MyCompanyScreen.routeName, extra: company.owner?.id),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(color: Colors.orange.withOpacity(0.3)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company Image
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        image:
                            company.imageUrl != null &&
                                company.imageUrl!.isNotEmpty
                            ? DecorationImage(
                                image: CachedNetworkImageProvider(
                                  company.imageUrl!,
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child:
                          company.imageUrl == null || company.imageUrl!.isEmpty
                          ? const LogoPlaceholder(logoWidth: 30, logoHeight: 30)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    // Company Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (company.companyName ?? 'Unknown Company')
                                .toTitleCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            (company.category ?? '').toTitleCase(),
                            style: TextStyle(
                              fontSize: 14,
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (company.gstNumber != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'GST: ${company.gstNumber}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24),
                // Owner Info
                Row(
                  children: [
                    ClipOval(
                      child: company.owner?.profilepic?.isNotEmpty ?? false
                          ? CachedNetworkImage(
                              imageUrl: company.owner!.profilepic!,
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                width: 24,
                                height: 24,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.person, size: 12),
                              ),
                              errorWidget: (context, url, error) =>
                                  const LogoPlaceholder(
                                    logoWidth: 12,
                                    logoHeight: 12,
                                  ),
                            )
                          : const LogoPlaceholder(
                              logoWidth: 12,
                              logoHeight: 12,
                            ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        (company.owner?.username ?? 'Unknown Owner')
                            .toTitleCase(),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (formattedDate.isNotEmpty)
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                // Action Buttons
                Row(
                  children: [
                    // Expanded(
                    //   child: OutlinedButton(
                    //     onPressed: () => _showRejectDialog(context),
                    //     style: OutlinedButton.styleFrom(
                    //       foregroundColor: Colors.red,
                    //       side: const BorderSide(color: Colors.red),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //     ),
                    //     child: const Text('Reject'),
                    //   ),
                    // ),
                    // const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _showApproveDialog(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Approve'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showApproveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Approve GST Verification'),
        content: Text(
          'Are you sure you want to approve verification for ${company.companyName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              if (company.id != null) {
                context.read<AdminBloc>().add(
                  AdminEvent.approveGst(companyId: company.id!),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.green),
            child: const Text('Approve'),
          ),
        ],
      ),
    );
  }

  void _showRejectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Reject GST Verification'),
        content: Text(
          'Are you sure you want to reject verification for ${company.companyName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              if (company.id != null) {
                context.read<AdminBloc>().add(
                  AdminEvent.rejectGst(companyId: company.id!),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Reject'),
          ),
        ],
      ),
    );
  }
}
