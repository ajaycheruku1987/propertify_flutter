import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:propertify/l10n/app_localizations.dart';
import '../../home/bloc/home_bloc.dart';
import '../../notifications/bloc/notifications_bloc.dart';
import '../../notifications/models/notification_model.dart';
import '../../auth/presentation/auth_screen.dart';
import 'post_details.dart';
import '../../reels/presentation/reels_screen.dart';

import '../bloc/feed_bloc.dart';
import '../../home/models/feed_posts_response_model.dart';
import 'widgets/comments_bottom_sheet.dart';
import '../../reels/bloc/reels_bloc.dart';
import '../../reels/presentation/widgets/reel_comments_bottom_sheet.dart';

class MyPostCommentsScreen extends StatefulWidget {
  static const String routeName = '/my-post-comments';

  const MyPostCommentsScreen({super.key});

  @override
  State<MyPostCommentsScreen> createState() => _MyPostCommentsScreenState();
}

class _MyPostCommentsScreenState extends State<MyPostCommentsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch live feed posts belonging to user from the server
    context.read<FeedBloc>().add(
          const FeedEvent.getMyProperties(offset: 0, limit: 40),
        );
    // Fetch live reels belonging to user from the server
    context.read<ReelsBloc>().add(
          const ReelsEvent.getMyReels(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            l10n.comments,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: 'Comments'),
              Tab(text: 'Alerts History'),
            ],
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, homeState) {
            if (!homeState.showAddButton) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 64,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.welcomeToPropertify,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        l10n.signInToSync,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => context.push(AuthScreen.routeName),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        l10n.getStarted,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return TabBarView(
              children: [
                _buildLiveServerCommentsTab(),
                _buildAlertsHistoryTab(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLiveServerCommentsTab() {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, feedState) {
        return BlocBuilder<ReelsBloc, ReelsState>(
          builder: (context, reelsState) {
            if ((feedState.isPostLoading && feedState.myPropertiesList.isEmpty) ||
                (reelsState.isLoadingMyReels && reelsState.myReels.isEmpty)) {
              return const Center(child: CircularProgressIndicator());
            }

            final propertiesWithComments = feedState.myPropertiesList
                .where((p) => (p.commentsCount ?? 0) > 0)
                .toList();

            final reelsWithComments = reelsState.myReels
                .where((r) => (r.commentsCount ?? 0) > 0)
                .toList();

            if (propertiesWithComments.isEmpty && reelsWithComments.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.comment_bank_outlined,
                      size: 64,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'No active live comments on your posts or reels yet.',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              );
            }

            final totalItemsCount = propertiesWithComments.length + reelsWithComments.length;

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: totalItemsCount,
              separatorBuilder: (context, index) => const Divider(height: 24),
              itemBuilder: (context, index) {
                if (index < propertiesWithComments.length) {
                  final post = propertiesWithComments[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            if (post.id != null) {
                              CommentsBottomSheet.show(context, post.id!, true);
                            }
                          },
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.insert_comment_outlined,
                                  color: Theme.of(context).primaryColor,
                                  size: 24,
                                ),
                              ),
                              Positioned(
                                top: -4,
                                right: -4,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${post.commentsCount}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title ?? 'Untitled Post',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                post.city ?? 'Unknown location',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                                      ),
                                    ),
                                    child: const Text(
                                      'Feed',
                                      style: TextStyle(
                                        color: Color(0xFF6C5CE7),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  InkWell(
                                    onTap: () {
                                      if (post.id != null) {
                                        context.push('${PostDetailsScreen.routeName}?postId=${post.id}');
                                      }
                                    },
                                    child: Text(
                                      'View Post Details',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  TextButton(
                                    onPressed: () {
                                      if (post.id != null) {
                                        CommentsBottomSheet.show(context, post.id!, true);
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.reply, size: 14, color: Theme.of(context).primaryColor),
                                        const SizedBox(width: 2),
                                        Text(
                                          'Reply',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
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
                } else {
                  final reelIndex = index - propertiesWithComments.length;
                  final reel = reelsWithComments[reelIndex];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            if (reel.id != null) {
                              ReelCommentsBottomSheet.show(context, reel.id!, true);
                            }
                          },
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.movie_outlined,
                                  color: Colors.orange,
                                  size: 24,
                                ),
                              ),
                              Positioned(
                                top: -4,
                                right: -4,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${reel.commentsCount}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reel.description != null && reel.description!.isNotEmpty
                                    ? reel.description!
                                    : 'Untitled Reel Video',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                reel.location ?? 'Unknown location',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Colors.orange.withOpacity(0.2),
                                      ),
                                    ),
                                    child: const Text(
                                      'Reel',
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  InkWell(
                                    onTap: () {
                                      if (reel.id != null) {
                                        context.push('${ReelsScreen.routeName}?reelId=${reel.id}&showBackButton=true&isMyReels=true');
                                      }
                                    },
                                    child: Text(
                                      'View Reel Video',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  TextButton(
                                    onPressed: () {
                                      if (reel.id != null) {
                                        ReelCommentsBottomSheet.show(context, reel.id!, true);
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.reply, size: 14, color: Theme.of(context).primaryColor),
                                        const SizedBox(width: 2),
                                        Text(
                                          'Reply',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
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
              },
            );
          },
        );
      },
    );
  }

  Widget _buildAlertsHistoryTab() {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        final commentNotifications = state.notifications
            .where((n) =>
                n.type == 'comment' ||
                n.title.toLowerCase().contains('comment'))
            .toList();

        if (commentNotifications.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  size: 64,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 16),
                const Text(
                  'No recent comment alert notifications received.',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: commentNotifications.length,
          separatorBuilder: (context, index) => const Divider(height: 24),
          itemBuilder: (context, index) {
            final notification = commentNotifications[index];
            return _CommentNotificationCard(notification: notification);
          },
        );
      },
    );
  }
}

class _CommentNotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const _CommentNotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    final bool isReel = notification.body.toLowerCase().contains('reel') || 
                        notification.title.toLowerCase().contains('reel') ||
                        notification.type == 'reel_comment';
    final bool isUnread = !notification.isRead;

    void navigateToPost() {
      if (notification.referenceId != null && notification.referenceId!.isNotEmpty) {
         if (isReel) {
           context.push('${ReelsScreen.routeName}?reelId=${notification.referenceId}&showBackButton=true&isMyReels=true');
         } else {
           context.push('${PostDetailsScreen.routeName}?postId=${notification.referenceId}');
         }
      }
    }
    
    return InkWell(
      onTap: navigateToPost,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, right: 8.0),
              child: Icon(
                Icons.circle,
                size: 8,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          notification.body.isNotEmpty ? notification.body : notification.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat('MMM d').format(notification.timestamp),
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // Feed / Reel label
                      _buildBadge(
                        label: isReel ? 'Reel' : 'Feed',
                        backgroundColor: isReel 
                            ? Colors.orange.withOpacity(0.1) 
                            : Theme.of(context).primaryColor.withOpacity(0.1),
                        textColor: isReel ? Colors.orange.shade800 : Theme.of(context).primaryColor,
                      ),
                      
                      // unread / Replied status label
                      _buildBadge(
                        label: isUnread ? 'unread' : 'Replied',
                        backgroundColor: isUnread 
                            ? Colors.red.withOpacity(0.1) 
                            : Colors.green.withOpacity(0.1),
                        textColor: isUnread ? Colors.red : Colors.green.shade700,
                      ),

                      // Reply action button (only if unread)
                      if (isUnread)
                        _buildBadge(
                          label: 'Reply',
                          backgroundColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onTap: navigateToPost,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: label == 'Reply' ? null : Border.all(color: textColor.withOpacity(0.15)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
