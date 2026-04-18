import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/profile/models/banner_ad_model.dart';
import 'package:propertify/utils/env.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:propertify/utils/string_extensions.dart';

class BannerAdDetailView extends StatelessWidget {
  static const String routeName = '/banner-ad-detail';
  final BannerAdModel bannerAd;

  const BannerAdDetailView({super.key, required this.bannerAd});

  @override
  Widget build(BuildContext context) {
    final imageUrl = _resolveImage(bannerAd.imageUrls);

    // Calculate campaign info
    final startDate = bannerAd.createdAt != null
        ? DateTime.tryParse(bannerAd.createdAt!) ?? DateTime.now()
        : DateTime.now();
    final endDate = bannerAd.expiresAt != null
        ? DateTime.tryParse(bannerAd.expiresAt!) ??
              DateTime.now().add(const Duration(days: 15))
        : DateTime.now().add(const Duration(days: 15));

    final daysRemaining = endDate.difference(DateTime.now()).inDays;
    final statusText = daysRemaining > 0
        ? '$daysRemaining Days Left'
        : 'Expired';
    final startDateStr = DateFormat('dd MMM yyyy').format(startDate);
    final endDateStr = DateFormat('dd MMM yyyy').format(endDate);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Featured Ad',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          final role =
              profileState.userProfile?.role ??
              serviceLocator<AppCacheService>().getRole();
          final isAdmin = role?.toLowerCase() == 'admin';
          final currentUserId = profileState.userProfile?.id;
          final isOwner =
              currentUserId != null &&
              (currentUserId == bannerAd.userId ||
                  currentUserId == bannerAd.owner?.id);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Large Image
                Hero(
                  tag: bannerAd.id ?? 'banner',
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        (bannerAd.description ?? 'No description available.')
                            .capitalize(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),

                      if (isAdmin || isOwner) ...[
                        const SizedBox(height: 24),

                        // Campaign Status Section
                        const Text(
                          'Ad Status',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              _buildStatusRow(
                                Icons.timer_outlined,
                                'Remaining',
                                statusText,
                                color: daysRemaining > 0
                                    ? Colors.blue
                                    : Colors.red,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Divider(),
                              ),
                              _buildStatusRow(
                                Icons.calendar_today_outlined,
                                'Start Date',
                                startDateStr,
                              ),
                              const SizedBox(height: 12),
                              _buildStatusRow(
                                Icons.calendar_month_outlined,
                                'End Date',
                                endDateStr,
                              ),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 24),

                      // Owner Details
                      const Text(
                        'Owner Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(
                                context,
                              ).primaryColor.withOpacity(0.1),
                              backgroundImage:
                                  bannerAd.owner?.profileImage != null &&
                                      bannerAd.owner!.profileImage!.isNotEmpty
                                  ? NetworkImage(
                                      _resolveAvatar(
                                        bannerAd.owner!.profileImage!,
                                      ),
                                    )
                                  : null,
                              child:
                                  bannerAd.owner?.profileImage == null ||
                                      bannerAd.owner!.profileImage!.isEmpty
                                  ? Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bannerAd.owner?.username != null
                                        ? (bannerAd.owner?.username ?? '')
                                              .toTitleCase()
                                        : 'Property Owner',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // const Text(
                                  //   'Verified Seller',
                                  //   style: TextStyle(
                                  //     fontSize: 14,
                                  //     color: Colors.green,
                                  //     fontWeight: FontWeight.w500,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _handleContact(
                    context,
                    bannerAd.owner?.phoneNumber,
                    isCall: true,
                  ),
                  icon: const Icon(Icons.phone),
                  label: const Text('Call'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _handleContact(
                    context,
                    bannerAd.owner?.phoneNumber,
                    isCall: false,
                  ),
                  icon: const Icon(Icons.chat),
                  label: const Text('WhatsApp'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF25D366),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusRow(
    IconData icon,
    String label,
    String value, {
    Color? color,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: color ?? Colors.black54),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black87,
          ),
        ),
      ],
    );
  }

  String _resolveImage(List<String>? urls) {
    final String? first = urls != null && urls.isNotEmpty ? urls.first : null;
    if (first == null || first.isEmpty) {
      return 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=800&q=80';
    }
    return first.startsWith('http')
        ? first
        : '${env.baseUrl.replaceAll('api', '')}$first';
  }

  String _resolveAvatar(String path) {
    if (path.isEmpty) return '';
    return path.startsWith('http')
        ? path
        : '${env.baseUrl.replaceAll('api', '')}$path';
  }

  void _handleContact(
    BuildContext context,
    String? phoneNumber, {
    required bool isCall,
  }) {
    final isLoggedIn = context.read<HomeBloc>().state.showAddButton;
    if (!isLoggedIn) {
      context.push(AuthScreen.routeName);
      return;
    }

    if (phoneNumber == null || phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number not available')),
      );
      return;
    }
    if (isCall) {
      _makePhoneCall(phoneNumber);
    } else {
      _openWhatsApp(phoneNumber);
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _openWhatsApp(String phoneNumber) async {
    final whatsappUrl = "whatsapp://send?phone=$phoneNumber";
    final uri = Uri.parse(whatsappUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      final webUri = Uri.parse('https://wa.me/$phoneNumber');
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }
}
