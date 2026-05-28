import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/admin/bloc/admin_bloc.dart';
import 'package:propertify/features/auth/bloc/auth_bloc.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/features/create_post/bloc/create_post_bloc.dart';
import 'package:propertify/features/feed/bloc/feed_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/reels/bloc/reels_bloc.dart';
import 'package:propertify/features/requests/bloc/requests_bloc.dart';
import 'package:propertify/features/sales/bloc/sales_bloc.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/custom_toast.dart';

class DeactivateAccountScreen extends StatefulWidget {
  static const String routeName = '/deactivate-account';

  const DeactivateAccountScreen({super.key});

  @override
  State<DeactivateAccountScreen> createState() =>
      _DeactivateAccountScreenState();
}

class _DeactivateAccountScreenState extends State<DeactivateAccountScreen> {
  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
              SizedBox(width: 8),
              Text(
                'Delete Account?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: const Text(
            'Are you absolutely sure you want to delete your account? This action is permanent and cannot be undone. All your posts, services, requests, and profile details will be permanently removed.',
            style: TextStyle(fontSize: 15, height: 1.4),
          ),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<ProfileBloc>().add(
                  const ProfileEvent.deleteAccount(
                    password: '',
                    actionType: 'delete',
                  ),
                );
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.notifyStatus != current.notifyStatus,
      listener: (context, state) {
        if (state.notifyStatus != null && !state.isLoading) {
          final msg = state.notifyStatus!.message;
          if (msg.toLowerCase().contains('scheduled for deletion') ||
              msg.toLowerCase().contains('reactivate') ||
              msg.toLowerCase().contains('delete') ||
              msg.toLowerCase().contains('success')) {
            
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: const Row(
                    children: [
                      Icon(Icons.info_outline_rounded, color: Colors.blue, size: 28),
                      SizedBox(width: 8),
                      Text(
                        'Account Deletion',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  content: Text(
                    msg,
                    style: const TextStyle(fontSize: 15, height: 1.4),
                  ),
                  actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      ),
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        
                        // Logout and clear all blocs and tokens
                        context.read<AuthBloc>().add(const AuthEvent.logout());
                        context.read<AdminBloc>().add(const AdminEvent.reset());
                        context.read<CompanyBloc>().add(const CompanyEvent.resetState());
                        context.read<HomeBloc>().add(const HomeEvent.reset());
                        context.read<ProfileBloc>().add(const ProfileEvent.reset());
                        context.read<FeedBloc>().add(const FeedEvent.reset());
                        context.read<ReelsBloc>().add(const ReelsEvent.reset());
                        context.read<RequestsBloc>().add(const RequestsEvent.reset());
                        context.read<SalesBloc>().add(const SalesEvent.reset());
                        context.read<ServicesBloc>().add(const ServicesEvent.reset());
                        context.read<CreatePostBloc>().add(const CreatePostEvent.resetState());

                        // Navigate to login screen
                        context.go(AuthScreen.routeName);
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            CustomToast.showErrorToast(msg: msg);
          }
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black87),
                onPressed: () => context.pop(),
              ),
              title: const Text(
                'Delete Account',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.red,
                        size: 64,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Center(
                    child: Text(
                      'Delete Your Account',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'We are sad to see you go',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.red.shade100),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Important Warning:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildWarningItem(
                          'All your listings, services, and posts will be deleted permanently.',
                        ),
                        const SizedBox(height: 8),
                        _buildWarningItem(
                          'Your profile details and metadata will be removed.',
                        ),
                        const SizedBox(height: 8),
                        _buildWarningItem(
                          'This action is final and cannot be undone.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  CommonCustomButton(
                    onTap: _showDeleteConfirmationDialog,
                    buttonLabel: 'Delete Account',
                    buttonColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWarningItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: Icon(
            Icons.fiber_manual_record,
            color: Colors.red,
            size: 8,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade800,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
