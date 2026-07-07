import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/features/profile/presentation/edit_profile_screen.dart';
import 'package:propertify/features/profile/presentation/my_banner_ads_screen.dart';
import 'package:propertify/features/profile/presentation/my_posts_screen.dart';
import 'package:propertify/features/reels/presentation/my_reels_screen.dart';
import 'package:propertify/features/requests/presentation/my_requests_screen.dart';
import 'package:propertify/features/profile/presentation/feedback_list_screen.dart';
import 'package:propertify/utils/custom_toast.dart';
import '../bloc/profile_bloc.dart';
import '../../feed/presentation/favorites_screen.dart';
import '../../services/presentation/my_services_screen.dart';

class MyDashboardScreen extends StatelessWidget {
  static const String routeName = '/my-dashboard';

  const MyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CompanyBloc, CompanyState>(
          listener: (context, state) {
            if (state.isSuccess &&
                state.errorMessage == 'Company deleted successfully') {
              CustomToast.showSuccessToast(msg: state.errorMessage!);
              context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
            } else if (state.errorMessage != null &&
                state.errorMessage!.isNotEmpty &&
                !state.isSuccess) {
              if (!state.errorMessage!.toLowerCase().contains('not found')) {
                CustomToast.showErrorToast(msg: state.errorMessage!);
              }
            }
          },
        ),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          return BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, companyState) {
              final List<Map<String, dynamic>> items = [
                {
                  'title': 'My Posts',
                  'icon': Icons.grid_view_rounded,
                  'onTap': () => context.push(MyPostsScreen.routeName),
                },
                {
                  'title': 'My Reels',
                  'icon': Icons.movie_outlined,
                  'onTap': () => context.push(MyReelsScreen.routeName),
                },
                {
                  'title': 'My Requests',
                  'icon': Icons.description_outlined,
                  'onTap': () => context.push(MyRequestsScreen.routeName),
                },
                {
                  'title': 'My Services',
                  'icon': Icons.home_repair_service_outlined,
                  'onTap': () => context.push(MyServicesScreen.routeName),
                },
                {
                  'title': 'Banner Promotions',
                  'icon': Icons.campaign_outlined,
                  'onTap': () => context.push(MyBannerAdsScreen.routeName),
                },
                {
                  'title': 'My Favourites',
                  'icon': Icons.favorite_outline,
                  'onTap': () => context.push(FavoritesScreen.routeName),
                },
                {
                  'title': 'Edit Profile',
                  'icon': Icons.person_outline,
                  'onTap': () {
                    if (profileState.userProfile != null) {
                      context.push(
                        EditProfileScreen.routeName,
                        extra: profileState.userProfile,
                      );
                    }
                  },
                },
                if (companyState.myCompany != null)
                  {
                    'title': 'Delete Company',
                    'icon': Icons.delete_sweep_outlined,
                    'onTap': () {
                      _showDeleteCompanyDialog(
                        context,
                        companyState.myCompany!.id!,
                      );
                    },
                  },
                {
                  'title': 'My Feedbacks',
                  'icon': Icons.feedback_outlined,
                  'onTap': () => context.push(FeedbackListScreen.routeName),
                },
                {
                  'title': 'Delete Account',
                  'icon': Icons.delete_outline_rounded,
                  'onTap': () => context.push('/deactivate-account'),
                },
              ];

              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => context.pop(),
                  ),
                  title: const Text(
                    'My Dashboard',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.85,
                        ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return _buildDashboardTile(
                        context,
                        item['title'],
                        item['icon'],
                        item['onTap'] as VoidCallback,
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showDeleteCompanyDialog(BuildContext context, String companyId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Company'),
          content: const Text(
            'Are you sure you want to delete your company? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<CompanyBloc>().add(
                  CompanyEvent.deleteCompany(companyId: companyId),
                );
                Navigator.of(context).pop();
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDashboardTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
