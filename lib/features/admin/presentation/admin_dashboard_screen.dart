import 'dart:io';
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
import 'companies_tabs_screen.dart';
import 'sales_tabs_screen.dart';
import 'admin_reels_screen.dart';
import 'gst_verification_requests_screen.dart';
import 'services_verification_requests_screen.dart';
import 'manage_material_prices_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  static const String routeName = '/admin-dashboard';
  final bool isSeller;
  final bool isMarketing;

  const AdminDashboardScreen({
    super.key,
    this.isSeller = false,
    this.isMarketing = false,
  });

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
    final Map<String, List<Map<String, dynamic>>> categorizedItems = {
      'Feeds': [
        {
          'title': 'Properties',
          'icon': Icons.home_outlined,
          'route': PropertiesListViewScreen.routeName,
        },
        {
          'title': 'Reels',
          'icon': Icons.video_collection_outlined,
          'route': AdminReelsScreen.routeName,
        },
        {
          'title': 'Boosted Ads',
          'icon': Icons.rocket_launch_outlined,
          'route': BannerAdsScreen.routeName,
        },
      ],
      'Services': [
        {
          'title': 'Services',
          'icon': Icons.psychology_outlined,
          'route': AllServicesListAdminView.routeName,
        },
        {
          'title': 'Service Verifications',
          'icon': Icons.verified_user_outlined,
          'route': ServicesVerificationRequests.routeName,
        },
        {
          'title': 'Material Prices',
          'icon': Icons.currency_rupee,
          'route': ManageMaterialPricesScreen.routeName,
        },
      ],
      'Requests': [
        {
          'title': 'Requests',
          'icon': Icons.verified_user_outlined,
          'route': '${RequestsScreen.routeName}?category=Buy,Rent',
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
      ],
      'Projects': [
        {
          'title': 'Sales/Projects',
          'icon': Icons.business_outlined,
          'route': SalesTabsScreen.routeName,
        },
        {
          'title': 'Companies',
          'icon': Icons.business_outlined,
          'route': CompaniesTabsScreen.routeName,
        },
      ],
      'User Management': [
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
          'title': 'Loan Team',
          'icon': Icons.storefront_outlined,
          'route': '${UserListScreen.routeName}?role=seller',
        },
        {
          'title': 'Interior Design Team',
          'icon': Icons.storefront_outlined,
          'route': '${UserListScreen.routeName}?role=marketing',
        },
        {
          'title': 'User Feedbacks',
          'icon': Icons.feedback_outlined,
          'route': '/feedback-list?isAdmin=true',
        },
      ],
    };

    Map<String, List<Map<String, dynamic>>> displayItems = {};

    if (widget.isMarketing) {
      displayItems = {
        'Requests': categorizedItems['Requests']!
            .where((item) => item['title'] == 'Interior Design Requests')
            .toList(),
      };
    } else if (widget.isSeller) {
      displayItems = {
        'Requests': categorizedItems['Requests']!
            .where((item) => item['title'] == 'Home Loan Requests')
            .toList(),
      };
    } else {
      displayItems = categorizedItems;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          widget.isMarketing
              ? 'Interior Design Dashboard'
              : widget.isSeller
                  ? 'Home Loans Dashboard'
                  : 'Admin Dashboard',
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: displayItems.entries.map((entry) {
          final String category = entry.key;
          final List<Map<String, dynamic>> items = entry.value;

          if (items.isEmpty) return const SizedBox.shrink();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
              const SizedBox(height: 16),
            ],
          );
        }).toList(),
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
                  fontSize: 11,
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
