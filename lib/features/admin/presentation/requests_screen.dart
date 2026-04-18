import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/custom_toast.dart';
import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import '../bloc/admin_bloc.dart';
import '../models/request_model.dart';
import '../repo/admin_repo.dart';

class RequestsScreen extends StatefulWidget {
  static const String routeName = '/admin-requests';
  final String? category;

  const RequestsScreen({super.key, this.category});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = widget.category?.split(',') ?? ['All'];
    final showTabs = categories.length > 1;

    if (!showTabs) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context, categories[0]),
              Expanded(child: RequestsListContent(category: widget.category)),
            ],
          ),
        ),
      );
    }

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context, 'Requests', isTabbed: true),
              Container(
                width: double.infinity,
                color: Theme.of(context).primaryColor.withOpacity(0.05),
                child: TabBar(
                  isScrollable: true,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: categories.map((c) => Tab(text: c)).toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: categories
                      .map((c) => RequestsListContent(category: c))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    String title, {
    bool isTabbed = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
              color: Colors.black87,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }
}

class RequestsListContent extends StatefulWidget {
  final String? category;
  const RequestsListContent({super.key, this.category});

  @override
  State<RequestsListContent> createState() => _RequestsListContentState();
}

class _RequestsListContentState extends State<RequestsListContent> {
  final ScrollController _scrollController = ScrollController();
  final AdminRepo _adminRepo = AdminRepo();
  List<RequestModel>? _requests;
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchRequests();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      if (!_isLoading && _hasMore) {
        _fetchRequests(isNextPage: true);
      }
    }
  }

  Future<void> _fetchRequests({bool isNextPage = false}) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    if (isNextPage) {
      _currentPage++;
    } else {
      _currentPage = 1;
    }

    // We use context.read<AdminBloc>().state to get repo or you might want to call AdminBloc event.
    // However, since we want tabs to work "individually" and AdminBloc has only ONE requests list,
    // we should probably let AdminBloc handle it but it will overwrite.
    // If we want them truly separate, we should fetch from repo here or update AdminBloc.
    // But since this is an agent, I'll update AdminBloc to handle category specific states if needed,
    // or just fetch locally here for better tab experience.

    // Actually, it's better to stick to Bloc. But if I use Bloc, switching tabs will overwrite.
    // Let's use the repository directly for local state management in tabs if they are on the same screen.
    // Wait, the project uses BLoC for everything.
    // I'll stick to triggering BLoC events, but I'll add a 'requests' map or separate lists in state if I could.
    // Given the constraints, I will fetch locally in this sub-widget to keep tabs independent.

    final result = await _adminRepo.getRequests(
      page: _currentPage,
      limit: 30,
      category: widget.category == 'All' ? null : widget.category,
    );

    if (mounted) {
      result.fold(
        (failure) {
          setState(() {
            _isLoading = false;
            _hasMore = false;
          });
          CustomToast.showErrorToast(msg: failure.message);
        },
        (response) {
          setState(() {
            _isLoading = false;
            final newRequests = response.requests ?? [];
            _hasMore = newRequests.length >= 30;
            if (isNextPage) {
              _requests = [...(_requests ?? []), ...newRequests];
            } else {
              _requests = newRequests;
            }
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && (_requests == null || _requests!.isEmpty)) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_requests == null || _requests!.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () => _fetchRequests(),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          final currentUserId = profileState.userProfile?.id;
          final role = serviceLocator<AppCacheService>()
              .getRole()
              ?.toLowerCase();
          final isAdmin = role == 'admin';

          return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: _requests!.length + (_hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == _requests!.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final request = _requests![index];
              return _buildRequestCard(request, isAdmin, currentUserId);
            },
          );
        },
      ),
    );
  }

  Widget _buildRequestCard(
    RequestModel request,
    bool isAdmin,
    String? currentUserId,
  ) {
    final isOwner = currentUserId != null && currentUserId == request.owner?.id;
    final canDelete = isAdmin || isOwner;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  request.category?.toUpperCase() ?? "GENERAL",
                  style: const TextStyle(
                    color: Color(0xFF673AB7),
                    fontSize: 12,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _formatDate(request.createdAt),
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              request.owner?.username ?? "Anonymous User",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263238),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.payments_outlined,
                            size: 18,
                            color: Color(0xFF455A64),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '₹${request.budget?.toString() ?? "0"}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF455A64),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 18,
                            color: Color(0xFF455A64),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${request.city ?? "N/A"}, ${request.state ?? ""}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF78909C),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => _showRequestDetails(request),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.visibility_outlined,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    if (canDelete) ...[
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () => _handleDeleteRequest(request.id ?? ''),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.delete_outline,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return "";
    try {
      final date = DateTime.parse(dateStr);
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return "${months[date.month - 1]} ${date.day}";
    } catch (e) {
      return dateStr.split('T')[0];
    }
  }

  void _showRequestDetails(RequestModel request) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Request Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16),
            _buildRequestDetail('Category', request.category),
            _buildRequestDetail('Description', request.description),
            _buildRequestDetail('Address', request.address),
            _buildRequestDetail('City', request.city),
            _buildRequestDetail('State', request.state),
            _buildRequestDetail(
              'Budget',
              '₹${request.budget?.toString() ?? "0"}',
            ),
            _buildRequestDetail('Phone', request.phoneNumber),
            _buildRequestDetail('Owner email', request.owner?.email),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestDetail(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No requests found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _handleDeleteRequest(String requestId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Request'),
        content: const Text('Are you sure you want to delete this request?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<AdminBloc>().add(
                AdminEvent.deleteRequest(requestId: requestId),
              );
              // Optimistically remove from local list
              setState(() {
                _requests?.removeWhere((r) => r.id == requestId);
              });
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
