import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/requests/bloc/requests_bloc.dart';
import 'package:propertify/features/home/presentation/widgets/request_tile_widget.dart';

class MyRequestsScreen extends StatefulWidget {
  static const String routeName = '/my-requests';
  const MyRequestsScreen({super.key});

  @override
  State<MyRequestsScreen> createState() => _MyRequestsScreenState();
}

class _MyRequestsScreenState extends State<MyRequestsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RequestsBloc>().add(const RequestsEvent.getMyRequests());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'My Requests',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<RequestsBloc, RequestsState>(
        builder: (context, state) {
          if (state.isMyRequestsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = state.myRequestsList;
          if (items.isEmpty) {
            return const Center(child: Text('No requests found'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final request = items[index];
              return RequestTileWidget(
                title: request.title ?? request.category ?? 'Unknown Request',
                ownerName: request.owner?.username ?? 'You',
                budget: request.budget?.toString() ?? 'Unknown Budget',
                location: '${request.city ?? ''}',
                description: request.description ?? '',
                type: request.category ?? 'General',
                onEditPressed: () {
                  context.push(
                    '/edit-request',
                    extra: request,
                  );
                },
                onDeletePressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Delete Request'),
                        content: const Text(
                          'Are you sure you want to delete this request?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context.read<RequestsBloc>().add(
                                RequestsEvent.deleteRequest(
                                  requestId: request.id!,
                                ),
                              );
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                onCallPressed: () {},
                onWhatsAppPressed: () {},
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
