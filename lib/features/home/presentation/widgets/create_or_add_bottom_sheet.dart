import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/app.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/features/company/presentation/gst_verification_screen.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/requests/presentation/create_request_details.dart';
import 'package:propertify/features/services/presentation/create_service_details.dart';
import '../../../feed/bloc/feed_bloc.dart';
import '../../../create_post/presentation/create_post_screen.dart';
import '../../../profile/presentation/create_banner_ad.dart';
import '../../../reels/presentation/create_reel.dart';
import '../../../sales/presentation/create_sales.dart';
import 'package:propertify/utils/custom_toast.dart';

class CreateOrAddBottomSheet extends StatelessWidget {
  const CreateOrAddBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CreateOrAddBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Create',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),

            // Options Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // First Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildOptionCard(
                          context: context,
                          icon: 'assets/icons/post.svg',
                          title: 'Create a Post',
                          subtitle: 'Share your properties with\nthe community',
                          color: Theme.of(context).primaryColor,
                          onTap: () async {
                            Navigator.pop(context);
                            await context.push(CreatePostScreen.routeName);
                            navigationKey.currentContext?.read<FeedBloc>().add(
                              const FeedEvent.getFeedsEvent(offset: 0),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildOptionCard(
                          context: context,
                          icon: 'assets/icons/reel.svg',
                          title: 'Create a Reel',
                          subtitle: 'Showcase properties with\nshort videos',
                          color: Theme.of(context).primaryColor,
                          onTap: () async {
                            Navigator.pop(context);

                            // Handle create reel
                            await context.push(CreateReelScreen.routeName);
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Second Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildOptionCard(
                          context: context,
                          icon: 'assets/icons/agent.svg',
                          title: 'Register as Service Agent',
                          subtitle: 'Offer your professional\nservices',
                          color: Theme.of(context).primaryColor,
                          onTap: () async {
                            Navigator.pop(context);
                            await context.push(CreateServiceDetails.routeName);

                            // Handle register as agent
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildOptionCard(
                          context: context,
                          icon: 'assets/icons/ads.svg',
                          title: 'Create a Banner Ad',
                          subtitle:
                              'Promote your business with\nadvertisements',
                          color: Theme.of(context).primaryColor,
                          onTap: () {
                            Navigator.pop(context);
                            context.push(CreateBannerAdScreen.routeName);
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Third Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildOptionCard(
                          context: context,
                          icon: 'assets/icons/request.svg',
                          title: 'Create a Request',
                          subtitle: 'Find properties that match\nyour needs',
                          color: Theme.of(context).primaryColor,
                          onTap: () {
                            Navigator.pop(context);
                            context.push(CreateRequestDetails.routeName);
                            // Handle create request
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Show different options based on company and GST status
                      Builder(
                        builder: (context) {
                          final company = context
                              .read<CompanyBloc>()
                              .state
                              .myCompany;
                          final hasCompany = company != null;
                          final status = company?.gstVerificationStatus;

                          // Case 1: Company exists and GST verification is pending -> Show Pending
                          if (hasCompany && status == 'pending') {
                            return Expanded(
                              child: _buildOptionCard(
                                context: context,
                                iconData: Icons.av_timer_rounded,
                                title: '24 HOURS',
                                subtitle:
                                    'You can create a project\nafter 24 hours',
                                color: Colors.orange,
                                onTap: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Verification is in progress. Please wait up to 24 hours.',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                          // Case 5: Company exists and GST verification is rejected -> Show Rejected
                          else if (hasCompany && status == 'rejected') {
                            return Expanded(
                              child: _buildOptionCard(
                                context: context,
                                iconData: Icons.error_outline_rounded,
                                title: 'GST Verification is Rejected',
                                subtitle: 'Please update the GST again',
                                color: Colors.red,
                                onTap: () {
                                  Navigator.pop(context);
                                  CustomToast.showWarningToast(
                                    msg: 'Feature coming soon',
                                  );
                                },
                              ),
                            );
                          }
                          // Case 2: Company exists and GST is verified (not none, not pending) -> Show Create Project
                          else if (hasCompany &&
                              status != null &&
                              status != 'none') {
                            return Expanded(
                              child: _buildOptionCard(
                                context: context,
                                icon: 'assets/icons/sales.svg',
                                title: 'Create Project',
                                subtitle:
                                    'List your projects for\nsale or rent',
                                color: Theme.of(context).primaryColor,
                                onTap: () async {
                                  Navigator.pop(context);
                                  await context.push(
                                    CreateSalesScreen.routeName,
                                  );
                                },
                              ),
                            );
                          }
                          // Case 3: Company exists but GST not verified (none/null) -> Show Verify GST
                          else if (hasCompany) {
                            return Expanded(
                              child: _buildOptionCard(
                                context: context,
                                icon: 'assets/images/gst_inreview.svg',
                                title: 'Verify GST',
                                subtitle:
                                    'Verify company GST to\nstart posting projects',
                                color: Theme.of(context).primaryColor,
                                onTap: () async {
                                  Navigator.pop(context);
                                  context.push(
                                    '/verification-payment?type=gst&entityId=${company.id}&showSkip=false',
                                  );
                                },
                              ),
                            );
                          }
                          // Case 4: No company -> Show Create Company
                          else {
                            return Expanded(
                              child: _buildOptionCard(
                                context: context,
                                icon: 'assets/images/my_company.svg',
                                title: 'Create Company',
                                subtitle:
                                    'Register your company to\ncreate projects',
                                color: Theme.of(context).primaryColor,
                                onTap: () async {
                                  Navigator.pop(context);
                                  context.push(GstVerificationScreen.routeName);
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Select Button
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //         // Handle select action
            //       },
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Theme.of(context).primaryColor,
            //         foregroundColor: Colors.white,
            //         padding: const EdgeInsets.symmetric(vertical: 16),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         elevation: 0,
            //       ),
            //       child: const Text(
            //         'Select',
            //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            //       ),
            //     ),
            //   ),
            // ),

            // const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    String? icon,
    IconData? iconData,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        if (!context.read<HomeBloc>().state.showAddButton) {
          context.push(AuthScreen.routeName);
          return;
        }
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
              SvgPicture.asset(icon, height: 24, color: color)
            else if (iconData != null)
              Icon(iconData, size: 24, color: color),

            const SizedBox(height: 12),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                color: color.withOpacity(0.7),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
