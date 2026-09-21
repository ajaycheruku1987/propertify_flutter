import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/utils/extensions/date_time_extensions.dart';
import '../../bloc/feed_bloc.dart';
import '../../models/feed_comment_model.dart';

class CommentsBottomSheet extends StatefulWidget {
  final String propertyId;
  final bool showCommentField;

  const CommentsBottomSheet({
    Key? key,
    required this.propertyId,
    required this.showCommentField,
  }) : super(key: key);

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();

  static Future<void> show(
    BuildContext context,
    String propertyId,
    bool showCommentField,
  ) {
    // Load comments when bottom sheet is shown
    context.read<FeedBloc>().add(
      FeedEvent.getCommentsById(propertyId: propertyId),
    );

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SafeArea(
        child: CommentsBottomSheet(
          propertyId: propertyId,
          showCommentField: showCommentField,
        ),
      ),
    );
  }
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _commentFocusNode = FocusNode();

  // Emoji list matching the design
  final List<String> _emojis = [
    '❤️',
    '😆',
    '😢',
    '😃',
    '😮',
    '😭',
    '😡',
    '😍',
    '🤩',
  ];

  @override
  void dispose() {
    _commentController.dispose();
    _scrollController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  void _sendComment() {
    if (_commentController.text.trim().isEmpty) return;

    context.read<FeedBloc>().add(
      FeedEvent.addCommentToProperty(
        propertyId: widget.propertyId,
        text: _commentController.text.trim(),
      ),
    );

    // Clear the input field
    _commentController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.viewInsets.bottom;

    return Container(
      height: mediaQuery.size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header
          _buildHeader(),

          // Comments List
          Expanded(
            child: BlocBuilder<FeedBloc, FeedState>(
              builder: (context, state) {
                if (state.commentsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.feedComments.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'No comments yet. Be the first to comment!',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.feedComments.length,
                  itemBuilder: (context, index) {
                    return _buildCommentItem(state.feedComments[index]);
                  },
                );
              },
            ),
          ),

          // Emoji Bar
          // _buildEmojiBar(),

          // Comment Input
          _buildCommentInput(bottomPadding),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        children: [
          // Drag Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Title
          const Text(
            'Comments',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmojiBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ..._emojis.map((emoji) => _buildEmojiButton(emoji)),
          _buildEmojiButton('📎', isAttachment: true),
          _buildEmojiButton('GIF', isGif: true),
        ],
      ),
    );
  }

  Widget _buildEmojiButton(
    String emoji, {
    bool isAttachment = false,
    bool isGif = false,
  }) {
    return InkWell(
      onTap: () {
        // Handle emoji/attachment/gif tap
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(4),
        child: isGif
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  emoji,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
              )
            : Text(emoji, style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  Widget _buildCommentInput(double bottomPadding) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 16, bottomPadding + 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: context.read<HomeBloc>().state.showAddButton
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _commentController,
                      focusNode: _commentFocusNode,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'write a comment....',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendComment,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF6C5CE7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          : GestureDetector(
              onTap: () {
                context.push('/auth-screen');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C5CE7).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFF6C5CE7),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.login, color: Color(0xFF6C5CE7), size: 20),
                    const SizedBox(width: 8),
                    const Text(
                      'Login to comment',
                      style: TextStyle(
                        color: Color(0xFF6C5CE7),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildCommentItem(FeedCommentModel comment) {
    final bool isReply = (comment.comment ?? '').trim().startsWith('@');

    return Container(
      margin: EdgeInsets.only(bottom: 16, left: isReply ? 40 : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Avatar
          Container(
            width: isReply ? 32 : 40,
            height: isReply ? 32 : 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF6C5CE7),
            ),
            child: Center(
              child: Text(
                (comment.username ?? 'U').substring(0, 1).toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isReply ? 14 : 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      (comment.username ?? 'Propertify User'),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDate(comment.createdAt ?? ''),
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                _buildCommentText(comment.comment ?? ''),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildActionButton('Reply', onTap: () {
                      if (comment.username != null) {
                        _commentController.text = '@${comment.username} ';
                        _commentController.selection = TextSelection.fromPosition(
                          TextPosition(offset: _commentController.text.length),
                        );
                        _commentFocusNode.requestFocus();
                      }
                    }),
                  ],
                ),
              ],
            ),
          ),
          // Delete button (if needed)
          context.read<HomeBloc>().state.showAddButton &&
                  comment.userId ==
                      context.read<ProfileBloc>().state.userProfile?.id
              ? IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.grey[400],
                    size: 18,
                  ),
                  onPressed: () {
                    // Handle delete
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildCommentText(String text) {
    if (text.startsWith('@')) {
      final parts = text.split(' ');
      if (parts.isNotEmpty) {
        final tag = parts[0];
        final remainingText = parts.skip(1).join(' ');
        return Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: tag,
                style: const TextStyle(
                  color: Color(0xFF6C5CE7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: ' $remainingText'),
            ],
          ),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            height: 1.4,
          ),
        );
      }
    }

    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black87,
        height: 1.4,
      ),
    );
  }

  Widget _buildActionButton(String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays > 0) {
        return '${difference.inDays}d ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}h ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}m ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return '4m ago';
    }
  }
}
