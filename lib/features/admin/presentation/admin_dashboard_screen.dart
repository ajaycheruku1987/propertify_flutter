import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../profile/bloc/profile_bloc.dart';
import 'all_services_list_admin_view.dart';
import 'admin_companies_screen.dart';
import 'banner_ads_screen.dart';
import 'callback_request_screen.dart';
import 'manage_projects_screen.dart';
import 'requests_screen.dart';
import 'user_list_screen.dart';
import 'properties_list_view_screen.dart';
import 'services_verification_requests_screen.dart';
import 'admin_reels_screen.dart';
import 'gst_verification_requests_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  static const String routeName = '/admin-dashboard';
  final bool isSeller;

  const AdminDashboardScreen({super.key, this.isSeller = false});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'title': 'Users',
        'icon': Icons.people_outline,
        'route': '${UserListScreen.routeName}?role=user',
      },
      {
        'title': 'Admins',
        'icon': Icons.admin_panel_settings_outlined,
        'route': '${UserListScreen.routeName}?role=admin',
      },
      {
        'title': 'Sellers',
        'icon': Icons.storefront_outlined,
        'route': '${UserListScreen.routeName}?role=seller',
      },
      {
        'title': 'Requests',
        'icon': Icons.verified_user_outlined,
        'route': '${RequestsScreen.routeName}?category=Buy,Rent',
      },
      {
        'title': 'Services',
        'icon': Icons.psychology_outlined,
        'route': AllServicesListAdminView.routeName,
      },
      {
        'title': 'Services Verification',
        'icon': Icons.verified_user_outlined,
        'route': ServicesVerificationRequests.routeName,
      },
      {
        'title': 'GST Verification',
        'icon': Icons.business,
        'route': GstVerificationRequestsScreen.routeName,
      },
      {
        'title': 'Properties',
        'icon': Icons.home_outlined,
        'route': PropertiesListViewScreen.routeName,
      },
      {
        'title': 'Boosted Ads',
        'icon': Icons.rocket_launch_outlined,
        'route': BannerAdsScreen.routeName,
      },
      {
        'title': 'Sales/Projects',
        'icon': Icons.business_outlined,
        'route': ManageProjectsScreen.routeName,
      },
      {
        'title': 'Call Back Requests',
        'icon': Icons.phone_callback_outlined,
        'route': CallbackRequestScreen.routeName,
      },
      {
        'title': 'Home Loan Requests',
        'icon': Icons.home_work_outlined,
        'route': '${RequestsScreen.routeName}?category=Loan',
      },
      {
        'title': 'Interior Design Requests',
        'icon': Icons.format_paint_outlined,
        'route': '${RequestsScreen.routeName}?category=Interior Design',
      },
      {
        'title': 'Companies',
        'icon': Icons.business_outlined,
        'route': AdminCompaniesScreen.routeName,
      },
      {
        'title': 'Reels',
        'icon': Icons.video_collection_outlined,
        'route': AdminReelsScreen.routeName,
      },
    ];

    if (widget.isSeller) {
      items = items.where((item) {
        return item['title'] == 'Home Loan Requests' ||
            item['title'] == 'Interior Design Requests';
      }).toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          widget.isSeller ? 'Seller Dashboard' : 'Admin Dashboard',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [const SizedBox(width: 8)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              item['route'],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDashboardTile(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return InkWell(
      onTap: () => context.push(route),
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
