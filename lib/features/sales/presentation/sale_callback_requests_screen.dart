import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:propertify/core/app_theme.dart';
import 'package:propertify/features/sales/bloc/sales_bloc.dart';

class SaleCallbackRequestsScreen extends StatefulWidget {
  static const String routeName = '/sale-callback-requests';

  final String projectId;
  final String projectName;

  const SaleCallbackRequestsScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  State<SaleCallbackRequestsScreen> createState() =>
      _SaleCallbackRequestsScreenState();
}

class _SaleCallbackRequestsScreenState
    extends State<SaleCallbackRequestsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SalesBloc>().add(
      SalesEvent.getProjectCallbacks(projectId: widget.projectId),
    );
  }

  Future<void> _confirmDelete(String callbackId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Delete Request?'),
        content: const Text(
          'This will permanently remove this callback request.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true && mounted) {
      context.read<SalesBloc>().add(
        SalesEvent.deleteCallback(
          callbackId: callbackId,
          projectId: widget.projectId,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Call Requests',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              widget.projectName,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<SalesBloc, SalesState>(
        builder: (context, state) {
          if (state.callbacksLoading && state.projectCallbacks.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.projectCallbacks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppTheme.blueColor.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.phone_missed_outlined,
                      size: 56,
                      color: AppTheme.blueColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'No Call Requests Yet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Callback requests from interested buyers\nwill appear here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<SalesBloc>().add(
                SalesEvent.getProjectCallbacks(projectId: widget.projectId),
              );
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.projectCallbacks.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final cb = state.projectCallbacks[index];

                String formattedDate = '';
                if (cb.createdAt != null) {
                  try {
                    formattedDate = DateFormat('dd MMM yyyy, hh:mm a').format(
                      DateTime.parse(cb.createdAt!).toLocal(),
                    );
                  } catch (_) {}
                }

                final statusColor = _statusColor(cb.status);

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header row — name + delete
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Avatar
                            CircleAvatar(
                              radius: 22,
                              backgroundColor:
                                  AppTheme.blueColor.withOpacity(0.12),
                              child: Text(
                                (cb.name?.isNotEmpty == true
                                        ? cb.name![0]
                                        : '?')
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.blueColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cb.name ?? 'Unknown',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  if (cb.phoneNumber?.isNotEmpty == true) ...[
                                    const SizedBox(height: 2),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone_outlined,
                                          size: 13,
                                          color: Colors.grey[600],
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          cb.phoneNumber!,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            // Delete button
                            IconButton(
                              onPressed: cb.id != null
                                  ? () => _confirmDelete(cb.id!)
                                  : null,
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.red[400],
                                size: 22,
                              ),
                              tooltip: 'Delete request',
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),
                        const Divider(height: 1),
                        const SizedBox(height: 12),

                        // Details grid
                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: [
                            if (cb.email?.isNotEmpty == true)
                              _infoChip(
                                Icons.email_outlined,
                                cb.email!,
                                Colors.purple,
                              ),
                            if (cb.preferredTime?.isNotEmpty == true)
                              _infoChip(
                                Icons.schedule_outlined,
                                'Preferred: ${cb.preferredTime!}',
                                Colors.orange,
                              ),
                            if (formattedDate.isNotEmpty)
                              _infoChip(
                                Icons.calendar_today_outlined,
                                formattedDate,
                                Colors.teal,
                              ),
                            if (cb.status?.isNotEmpty == true)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: statusColor.withOpacity(0.4),
                                  ),
                                ),
                                child: Text(
                                  (cb.status ?? '').toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: statusColor,
                                  ),
                                ),
                              ),
                          ],
                        ),

                        // Message
                        if (cb.message?.isNotEmpty == true) ...[
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey[200]!),
                            ),
                            child: Text(
                              cb.message!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _infoChip(IconData icon, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }

  Color _statusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'completed':
      case 'resolved':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }
}
