import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:propertify/features/admin/bloc/admin_bloc.dart';
import 'package:propertify/features/feed/presentation/post_details.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:propertify/utils/custom_toast.dart';

class ReportedPropertiesScreen extends StatefulWidget {
  static const String routeName = '/admin-reported-properties';

  const ReportedPropertiesScreen({super.key});

  @override
  State<ReportedPropertiesScreen> createState() =>
      _ReportedPropertiesScreenState();
}

class _ReportedPropertiesScreenState extends State<ReportedPropertiesScreen> {
  final int _currentPage = 1;
  final int _limit = 20;

  @override
  void initState() {
    super.initState();
    _loadProperties();
  }

  void _loadProperties() {
    context.read<AdminBloc>().add(
          AdminEvent.getAdminProperties(
            page: _currentPage,
            limit: _limit,
            isReported: true,
          ),
        );
  }

  String _formatTime(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return 'Recently';
    try {
      final dateTime = DateTime.parse(dateStr).toLocal();
      return DateFormat('MMM d, yyyy • h:mm a').format(dateTime);
    } catch (e) {
      return dateStr;
    }
  }

  void _navigateToPostDetails(FeedPostsResponseModel item) {
    final String propertyId = item.id ?? '';
    if (propertyId.isEmpty) return;

    final String reportedBy = item.reportedBy ?? 'Platform User';
    final String reportReason =
        item.reportReason ?? 'Flagged for content & policy review';
    final String reportedAt = item.reportedAt ?? item.createdAt ?? '';

    final Uri uri = Uri(
      path: PostDetailsScreen.routeName,
      queryParameters: {
        'postId': propertyId,
        'isReported': 'true',
        'reportedBy': reportedBy,
        'reportReason': reportReason,
        if (reportedAt.isNotEmpty) 'reportedAt': reportedAt,
      },
    );

    context.push(uri.toString());
  }

  void _deleteProperty(String propertyId) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete Reported Property'),
          content: const Text(
            'Are you sure you want to delete this property from the platform?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(dialogContext);
                context.read<AdminBloc>().add(
                      AdminEvent.deleteAdminProperty(propertyId: propertyId),
                    );
                CustomToast.showSuccessToast(
                  msg: 'Property deleted successfully.',
                );
                _loadProperties();
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _releaseProperty(String propertyId) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Release Reported Property'),
          content: const Text(
            'Are you sure you want to release this property, clearing the report and keeping it active?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.pop(dialogContext);
                context.read<AdminBloc>().add(
                      AdminEvent.releaseAdminProperty(propertyId: propertyId),
                    );
                CustomToast.showSuccessToast(
                  msg: 'Property released successfully.',
                );
                _loadProperties();
              },
              child: const Text(
                'Release',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Reported & Moderated Posts',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final properties = state.properties;

          if (properties == null || properties.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No reported or flagged properties found',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: properties.length,
            itemBuilder: (context, index) {
              final item = properties[index];
              final String propertyId = item.id ?? '';
              final String title = item.title ?? 'Property Item';
              final String city = item.city ?? 'N/A';
              final String price = item.price?.toString() ?? '0';

              final String ownerName = item.owner != null
                  ? '${item.owner?.firstName ?? ''} ${item.owner?.lastName ?? ''}'.trim()
                  : (item.owner?.username ?? item.postedBy ?? 'Owner');

              final String reportedBy = item.reportedBy ?? 'Platform User';
              final String reportReason =
                  item.reportReason ?? 'Flagged for admin moderation';
              final String formattedTime =
                  _formatTime(item.reportedAt ?? item.createdAt);

              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                margin: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => _navigateToPostDetails(item),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.report_problem_outlined,
                                color: Colors.red,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Owner: $ownerName  |  Location: $city  |  Price: ₹$price',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.orange.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 15,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Reported At: $formattedTime',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person_outline,
                                    size: 15,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Reported By: $reportedBy',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.info_outline,
                                    size: 15,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      'Reason: $reportReason',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(height: 1),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: () => _navigateToPostDetails(item),
                              icon: const Icon(Icons.visibility_outlined, size: 16),
                              label: const Text('View'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => _releaseProperty(propertyId),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(
                                Icons.check_circle_outline,
                                size: 16,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Release',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => _deleteProperty(propertyId),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(
                                Icons.delete_outline,
                                size: 16,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
