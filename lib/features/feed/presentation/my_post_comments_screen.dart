import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:propertify/l10n/app_localizations.dart';
import '../../../core/notification_router.dart';
import '../../home/bloc/home_bloc.dart';
import '../../notifications/bloc/notifications_bloc.dart';
import '../../notifications/models/notification_model.dart';
import '../../auth/presentation/auth_screen.dart';
import 'post_details.dart';
import '../../reels/presentation/reels_screen.dart';

import '../bloc/feed_bloc.dart';
import '../../home/models/feed_posts_response_model.dart';
import '../../reels/models/reel_response_model.dart';
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
              Tab(text: 'Notifications'),
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
                _buildNotificationsTab(),
              ],
            );
          },
        ),
      ),
    );
  }

  int _getUnreadCount(
    String id,
    int totalComments,
    NotificationsState notifState,
  ) {
    if (id.isEmpty || totalComments <= 0) return 0;

    if (notifState.readCommentCounts.containsKey(id)) {
      final readCount = notifState.readCommentCounts[id] ?? 0;
      final unread = totalComments - readCount;
      return unread > 0 ? unread : 0;
    }

    final unreadNotifs = notifState.unreadNotifications.where(
      (n) =>
          n.referenceId == id ||
          n.data?['post_id'] == id ||
          n.data?['reel_id'] == id,
    ).length;

    if (unreadNotifs > 0) {
      return unreadNotifs;
    }

    return totalComments;
  }

  void _markCommentsRead(String? id, int count) {
    if (id != null && id.isNotEmpty) {
      context.read<NotificationsBloc>().add(
            MarkCommentsAsRead(id: id, count: count),
          );
    }
  }

  Widget _buildLiveServerCommentsTab() {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, notifState) {
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

                final commentItems = <_CommentItem>[
                  ...propertiesWithComments.map((p) => _CommentItem.fromPost(p)),
                  ...reelsWithComments.map((r) => _CommentItem.fromReel(r)),
                ];

                commentItems.sort((a, b) {
                  final unreadA = _getUnreadCount(a.id, a.commentsCount, notifState) > 0 ? 1 : 0;
                  final unreadB = _getUnreadCount(b.id, b.commentsCount, notifState) > 0 ? 1 : 0;
                  if (unreadA != unreadB) {
                    return unreadB.compareTo(unreadA); // unread items first (top)
                  }
                  return b.parsedDate.compareTo(a.parsedDate); // newest date first
                });

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: commentItems.length,
                  separatorBuilder: (context, index) => const Divider(height: 24),
                  itemBuilder: (context, index) {
                    final item = commentItems[index];
                    if (!item.isReel) {
                      final post = item.post!;
                      final totalComments = post.commentsCount ?? 0;
                      final unreadCount = _getUnreadCount(post.id ?? '', totalComments, notifState);

                      return InkWell(
                        onTap: () {
                          if (post.id != null) {
                            _markCommentsRead(post.id, totalComments);
                            CommentsBottomSheet.show(context, post.id!, true);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (post.id != null) {
                                    _markCommentsRead(post.id, totalComments);
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
                                    if (unreadCount > 0)
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
                                              '$unreadCount',
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
                                              _markCommentsRead(post.id, totalComments);
                                              context.push('${PostDetailsScreen.routeName}?postId=${post.id}');
                                            }
                                          },
                                          child: Container(
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
                                            child: Text(
                                              'View Post Details',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Theme.of(context).primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        TextButton(
                                          onPressed: () {
                                            if (post.id != null) {
                                              _markCommentsRead(post.id, totalComments);
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
                        ),
                      );
                    } else {
                      final reel = item.reel!;
                      final totalComments = reel.commentsCount ?? 0;
                      final unreadCount = _getUnreadCount(reel.id ?? '', totalComments, notifState);

                      return InkWell(
                        onTap: () {
                          if (reel.id != null) {
                            _markCommentsRead(reel.id, totalComments);
                            ReelCommentsBottomSheet.show(context, reel.id!, true);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (reel.id != null) {
                                    _markCommentsRead(reel.id, totalComments);
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
                                    if (unreadCount > 0)
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
                                              '$unreadCount',
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
                                              _markCommentsRead(reel.id, totalComments);
                                              context.push('${ReelsScreen.routeName}?reelId=${reel.id}&showBackButton=true&isMyReels=true');
                                            }
                                          },
                                          child: Container(
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
                                              'View Reel Video',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        TextButton(
                                          onPressed: () {
                                            if (reel.id != null) {
                                              _markCommentsRead(reel.id, totalComments);
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
                        ),
                      );
                    }
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildNotificationsTab() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: 'Unread'),
                Tab(text: 'Read'),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                _NotificationList(isRead: false),
                _NotificationList(isRead: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  final bool isRead;

  const _NotificationList({required this.isRead});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        final notifications = isRead ? state.readNotifications : state.unreadNotifications;

        if (notifications.isEmpty) {
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
                Text(
                  AppLocalizations.of(context)?.noNotifications ?? 'No notifications found.',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return _NotificationCard(notification: notification);
          },
        );
      },
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const _NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!notification.isRead) {
          context.read<NotificationsBloc>().add(MarkAsRead(notification.id));
        }
        final data = notification.data;
        if (data != null && data['type'] != null) {
          NotificationRouter.open(data);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIcon(notification.type),
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: TextStyle(
                            fontWeight: notification.isRead ? FontWeight.w500 : FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('MMM d, h:mm a').format(notification.timestamp),
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _cleanBody,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _cleanBody {
    if (notification.body.contains('__PROPS__')) {
      return notification.body.split('__PROPS__').first.trim();
    }
    return notification.body;
  }

  IconData _getIcon(String? type) {
    switch (type) {
      case 'property':
      case 'new_post':
        return Icons.home_work_outlined;
      case 'like':
      case 'reel_like':
        return Icons.thumb_up_outlined;
      case 'comment':
      case 'reel_comment':
        return Icons.comment_outlined;
      case 'favourite':
        return Icons.favorite_border;
      case 'service_review':
        return Icons.star_border;
      case 'verification':
      case 'gst_verification':
        return Icons.verified_outlined;
      default:
        return Icons.notifications_outlined;
    }
  }
}

class _CommentItem {
  final String id;
  final String title;
  final String location;
  final int commentsCount;
  final String? createdAt;
  final bool isReel;
  final FeedPostsResponseModel? post;
  final ReelResponseModel? reel;

  _CommentItem.fromPost(FeedPostsResponseModel p)
      : id = p.id ?? '',
        title = p.title ?? 'Untitled Post',
        location = p.city ?? 'Unknown location',
        commentsCount = p.commentsCount ?? 0,
        createdAt = p.createdAt,
        isReel = false,
        post = p,
        reel = null;

  _CommentItem.fromReel(ReelResponseModel r)
      : id = r.id ?? '',
        title = r.description != null && r.description!.isNotEmpty ? r.description! : 'Untitled Reel Video',
        location = r.location ?? 'Unknown location',
        commentsCount = r.commentsCount ?? 0,
        createdAt = r.createdAt,
        isReel = true,
        post = null,
        reel = r;

  DateTime get parsedDate => DateTime.tryParse(createdAt ?? '') ?? DateTime(0);
}
