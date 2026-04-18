import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/profile_bloc.dart';
import '../models/banner_ad_model.dart';
import 'create_banner_ad.dart';
import 'package:intl/intl.dart';

class MyBannerAdsScreen extends StatefulWidget {
  static const String routeName = '/my-banner-ads';

  const MyBannerAdsScreen({super.key});

  @override
  State<MyBannerAdsScreen> createState() => _MyBannerAdsScreenState();
}

class _MyBannerAdsScreenState extends State<MyBannerAdsScreen> {
  @override
  void initState() {
    super.initState();
    // Load banner ads when screen initializes
    context.read<ProfileBloc>().add(const ProfileEvent.loadMyBannerAds());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F4FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Banner Ads',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.isLoading && (state.myBannerAds?.isEmpty ?? true)) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF8B5CF6)),
            );
          }

          final bannerAds = state.myBannerAds ?? [];

          if (bannerAds.isEmpty) {
            return _buildEmptyState();
          }

          return RefreshIndicator(
            color: const Color(0xFF8B5CF6),
            onRefresh: () async {
              context.read<ProfileBloc>().add(
                const ProfileEvent.loadBannerAds(),
              );
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: bannerAds.length,
              itemBuilder: (context, index) {
                return _buildBannerAdCard(bannerAds[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(CreateBannerAdScreen.routeName);
        },
        backgroundColor: const Color(0xFF8B5CF6),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Create Banner Ad',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.campaign_outlined, size: 100, color: Colors.grey.shade300),
          const SizedBox(height: 24),
          Text(
            'No Banner Ads Yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Create your first banner ad to get started',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              context.push(CreateBannerAdScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B5CF6),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Create Banner Ad',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerAdCard(BannerAdModel bannerAd) {
    // Parse dates
    final createdDate = bannerAd.createdAt != null
        ? DateTime.tryParse(bannerAd.createdAt!) ?? DateTime.now()
        : DateTime.now();
    final expiryDate = bannerAd.expiresAt != null
        ? DateTime.tryParse(bannerAd.expiresAt!) ??
              DateTime.now().add(const Duration(days: 30))
        : DateTime.now().add(const Duration(days: 30));

    final isExpired = expiryDate.isBefore(DateTime.now());
    final daysRemaining = expiryDate.difference(DateTime.now()).inDays;
    final imageUrls = bannerAd.imageUrls ?? [];
    final description = bannerAd.description ?? 'No description';
    final planName = bannerAd.planName ?? 'Unknown';
    final planDays = bannerAd.planDays ?? 0;
    final amount = bannerAd.amount ?? 0.0;
    final isApproved = bannerAd.approved ?? false;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          if (imageUrls.isNotEmpty)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: imageUrls.length == 1
                    ? Image.network(
                        imageUrls.first,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      )
                    : PageView.builder(
                        itemCount: imageUrls.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade200,
                                child: const Icon(
                                  Icons.broken_image,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ),

          // Content Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Badges Row
                Row(
                  children: [
                    _buildStatusChip(
                      isApproved ? 'Approved' : 'Pending',
                      isApproved ? Colors.green : Colors.orange,
                    ),
                    const SizedBox(width: 8),
                    if (isExpired)
                      _buildStatusChip('Expired', Colors.red)
                    else if (daysRemaining <= 3 && daysRemaining > 0)
                      _buildStatusChip(
                        '$daysRemaining days left',
                        Colors.orange,
                      )
                    else if (!isExpired)
                      _buildStatusChip('Active', Colors.blue),
                  ],
                ),
                const SizedBox(height: 12),

                // Description
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Plan Info
                Row(
                  children: [
                    Icon(
                      Icons.workspace_premium,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$planName Plan',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$planDays days',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Dates
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Created: ${DateFormat('MMM dd, yyyy').format(createdDate)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '₹${amount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B5CF6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.event, size: 16, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Text(
                      'Expires: ${DateFormat('MMM dd, yyyy').format(expiryDate)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: isExpired ? Colors.red : Colors.grey.shade600,
                        fontWeight: isExpired
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
