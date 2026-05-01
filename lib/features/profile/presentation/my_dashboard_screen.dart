import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/profile/presentation/my_banner_ads_screen.dart';
import 'package:propertify/features/profile/presentation/my_posts_screen.dart';
import 'package:propertify/features/reels/presentation/my_reels_screen.dart';
import 'package:propertify/features/requests/presentation/my_requests_screen.dart';
import '../../feed/presentation/favorites_screen.dart';
import '../../services/presentation/my_services_screen.dart';

class MyDashboardScreen extends StatelessWidget {
  static const String routeName = '/my-dashboard';

  const MyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'My Posts',
        'icon': Icons.grid_view_rounded,
        'route': MyPostsScreen.routeName,
      },
      {
        'title': 'My Reels',
        'icon': Icons.movie_outlined,
        'route': MyReelsScreen.routeName,
      },

      {
        'title': 'My Requests',
        'icon': Icons.description_outlined,
        'route': MyRequestsScreen.routeName,
      },
      {
        'title': 'My Services',
        'icon': Icons.home_repair_service_outlined,
        'route': MyServicesScreen.routeName,
      },
      {
        'title': 'Banner Promotions',
        'icon': Icons.campaign_outlined,
        'route': MyBannerAdsScreen.routeName,
      },
      {
        'title': 'My Favourites',
        'icon': Icons.favorite_outline,
        'route': FavoritesScreen.routeName,
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
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
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
