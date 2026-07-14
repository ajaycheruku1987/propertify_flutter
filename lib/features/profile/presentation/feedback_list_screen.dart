import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/profile/models/feedback_model.dart';
import 'package:propertify/features/profile/presentation/feedback_screen.dart';
import 'package:intl/intl.dart';

class FeedbackListScreen extends StatefulWidget {
  static const String routeName = '/feedback-list';
  final bool isAdmin;

  const FeedbackListScreen({super.key, this.isAdmin = false});

  @override
  State<FeedbackListScreen> createState() => _FeedbackListScreenState();
}

class _FeedbackListScreenState extends State<FeedbackListScreen> {
  @override
  void initState() {
    super.initState();
    _fetchFeedbacks();
  }

  void _fetchFeedbacks() {
    if (widget.isAdmin) {
      context.read<ProfileBloc>().add(const ProfileEvent.loadAllFeedbacks());
    } else {
      context.read<ProfileBloc>().add(const ProfileEvent.loadMyFeedbacks());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isAdmin ? 'User Feedbacks' : 'My Feedbacks'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          final originalFeedbacks =
              widget.isAdmin ? state.allFeedbacks : state.myFeedbacks;

          if (state.isLoading &&
              (originalFeedbacks == null || originalFeedbacks.isEmpty)) {
            return const Center(child: CircularProgressIndicator());
          }

          if (originalFeedbacks == null || originalFeedbacks.isEmpty) {
            return const Center(
              child: Text('No feedback found.'),
            );
          }

          // Create a sorted list descending by createdAt
          final feedbacks = List<FeedbackModel>.from(originalFeedbacks)
            ..sort((a, b) {
              final aTime = a.createdAt ?? DateTime(0);
              final bTime = b.createdAt ?? DateTime(0);
              return bTime.compareTo(aTime);
            });

          return RefreshIndicator(
            onRefresh: () async {
              _fetchFeedbacks();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: feedbacks.length,
              itemBuilder: (context, index) {
                final feedback = feedbacks[index];
                return _FeedbackTile(
                  feedback: feedback,
                  isAdmin: widget.isAdmin,
                  onDelete: () {
                    final feedbackId = feedback.id;
                    if (feedbackId != null) {
                      _showDeleteDialog(feedbackId);
                    }
                  },
                  onEdit: () {
                    context.push(FeedbackScreen.routeName, extra: feedback);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showDeleteDialog(String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Feedback'),
          content: const Text('Are you sure you want to delete this feedback?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<ProfileBloc>()
                    .add(ProfileEvent.deleteFeedback(id: id));
                Navigator.pop(context);
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

class _FeedbackTile extends StatelessWidget {
  final FeedbackModel feedback;
  final bool isAdmin;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const _FeedbackTile({
    required this.feedback,
    required this.isAdmin,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final String category = feedback.category ?? 'Feedback';
    final String subject = feedback.subject ?? '';
    final String description = feedback.description ?? '';
    final String userId = feedback.user ?? '';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getCategoryColor(category).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: _getCategoryColor(category),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                if (!isAdmin)
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit_outlined,
                            size: 20, color: Colors.blue),
                        onPressed: onEdit,
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            size: 20, color: Colors.red),
                        onPressed: onDelete,
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subject,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  feedback.createdAt != null
                      ? DateFormat('MMM dd, yyyy').format(feedback.createdAt!)
                      : '',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                if (isAdmin)
                  Text(
                    'User ID: $userId',
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'bug':
        return Colors.red;
      case 'suggestion':
        return Colors.blue;
      case 'feedback':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
