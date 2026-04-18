import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/notify_message.dart';
import '../../../utils/custom_toast.dart';
import '../../../utils/debouncer.dart';
import '../bloc/admin_bloc.dart';
import '../models/user_model.dart';
import 'widgets/admin_user_card.dart';
import 'widgets/regular_user_card.dart';

class UserListScreen extends StatefulWidget {
  static const String routeName = '/user-list-screen';
  final String? role;

  const UserListScreen({super.key, this.role});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  final Set<String> _selectedUserIds = {};
  bool _isSelectionMode = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<AdminBloc>().add(AdminEvent.getUserList(role: widget.role));
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _debouncer.run(() {
      if (_searchQuery != _searchController.text) {
        setState(() {
          _searchQuery = _searchController.text;
        });
        context.read<AdminBloc>().add(
          AdminEvent.getUserList(
            role: widget.role,
            search: _searchQuery.isEmpty ? null : _searchQuery,
          ),
        );
      }
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final state = context.read<AdminBloc>().state;
      if (!state.isLoading && state.hasMore) {
        context.read<AdminBloc>().add(
          AdminEvent.getUserList(
            page: state.currentPage + 1,
            limit: 30,
            role: widget.role,
            search: _searchQuery.isEmpty ? null : _searchQuery,
          ),
        );
      }
    }
  }

  void _toggleSelection(String userId) {
    setState(() {
      if (_selectedUserIds.contains(userId)) {
        _selectedUserIds.remove(userId);
        if (_selectedUserIds.isEmpty) {
          _isSelectionMode = false;
        }
      } else {
        _selectedUserIds.add(userId);
        _isSelectionMode = true;
      }
    });
  }

  void _clearSelection() {
    setState(() {
      _selectedUserIds.clear();
      _isSelectionMode = false;
    });
  }

  void _showConversionOptions() {
    final options = _getConversionOptions();
    final primaryColor = Theme.of(context).primaryColor;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.swap_horizontal_circle,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Convert Users',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${_selectedUserIds.length} user(s) selected',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Options
              ...options.asMap().entries.map((entry) {
                final index = entry.key;
                final option = entry.value;
                final isLast = index == options.length - 1;

                return Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(dialogContext).pop();
                        _convertUsers(option['action'] as String);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: primaryColor.withOpacity(0.3),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                option['icon'] as IconData,
                                color: primaryColor,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                option['label'] as String,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: primaryColor.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),

              const SizedBox(height: 20),

              // Cancel Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
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

  List<Map<String, dynamic>> _getConversionOptions() {
    final role = widget.role?.toLowerCase();

    if (role == 'user' || role == null) {
      return [
        {
          'label': 'Make Admin',
          'action': 'admin',
          'icon': Icons.admin_panel_settings,
        },
        {'label': 'Make Seller', 'action': 'seller', 'icon': Icons.store},
      ];
    } else if (role == 'admin') {
      return [
        {'label': 'Make Seller', 'action': 'seller', 'icon': Icons.store},
        {
          'label': 'Remove Admin Role',
          'action': 'user',
          'icon': Icons.person_remove,
        },
      ];
    } else if (role == 'seller') {
      return [
        {
          'label': 'Make Admin',
          'action': 'admin',
          'icon': Icons.admin_panel_settings,
        },
        {
          'label': 'Remove Seller Role',
          'action': 'user',
          'icon': Icons.person_remove,
        },
      ];
    }

    return [];
  }

  void _convertUsers(String targetRole) {
    final userIds = _selectedUserIds.toList();

    if (targetRole == 'admin') {
      context.read<AdminBloc>().add(
        AdminEvent.convertToAdmin(userIds: userIds, role: widget.role),
      );
    } else if (targetRole == 'seller') {
      context.read<AdminBloc>().add(
        AdminEvent.convertToSeller(userIds: userIds, role: widget.role),
      );
    } else if (targetRole == 'user') {
      context.read<AdminBloc>().add(
        AdminEvent.convertToUser(userIds: userIds, role: widget.role),
      );
    }

    _clearSelection();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {
        if (state.notifyStatus != null) {
          if (state.notifyStatus!.type == NotifyType.error) {
            CustomToast.showErrorToast(msg: state.notifyStatus?.message);
          } else {
            CustomToast.showSuccessToast(msg: state.notifyStatus?.message);
          }
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: state.isLoading && state.users == null,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  if (_isSelectionMode) _buildSelectedBanner(),
                  Expanded(
                    child: state.users == null || state.users!.isEmpty
                        ? _buildEmptyState()
                        : _buildUserList(state.users!),
                  ),
                ],
              ),
            ),
            floatingActionButton: _isSelectionMode
                ? FloatingActionButton.extended(
                    onPressed: _showConversionOptions,
                    icon: const Icon(Icons.swap_horiz),
                    label: Text('Convert (${_selectedUserIds.length})'),
                    backgroundColor: Theme.of(context).primaryColor,
                  )
                : null,
          ),
        );
      },
    );
  }

  Widget _buildSelectedBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${_selectedUserIds.length} user(s) selected',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: _clearSelection,
            icon: const Icon(Icons.close, size: 18),
            label: const Text('Clear'),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
        child: Column(
          children: [
            // Title Row
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.pop(),
                  color: Colors.black87,
                ),
                Expanded(
                  child: Text(
                    widget.role == null
                        ? 'All Users'
                        : '${widget.role![0].toUpperCase()}${widget.role!.substring(1).toLowerCase()}s',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 48), // Balance the back button
              ],
            ),
            const SizedBox(height: 12),
            // Search Field
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                ),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by name, email or phone...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade400,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 20),
                          onPressed: () {
                            _searchController.clear();
                          },
                          color: Colors.grey,
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                style: const TextStyle(fontSize: 14),
              ),
            ),
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
          Icon(Icons.people_outline, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'No users found',
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

  Widget _buildUserList(List<UserModel> users) {
    if (users.isEmpty) return _buildEmptyState();

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final userId = user.id ?? '';
        final isSelected = _selectedUserIds.contains(userId);
        final isAdminOrSeller =
            user.role != null &&
            (user.role!.toLowerCase() == 'admin' ||
                user.role!.toLowerCase() == 'seller' ||
                user.role!.toLowerCase() == 'expert');

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: _isSelectionMode && userId.isNotEmpty
                ? () => _toggleSelection(userId)
                : null,
            child: isAdminOrSeller
                ? AdminUserCard(
                    user: user,
                    isSelected: isSelected,
                    isSelectionMode: _isSelectionMode,
                    onProfileTap: userId.isNotEmpty
                        ? () => _toggleSelection(userId)
                        : null,
                  )
                : RegularUserCard(
                    user: user,
                    isSelected: isSelected,
                    isSelectionMode: _isSelectionMode,
                    onProfileTap: userId.isNotEmpty
                        ? () => _toggleSelection(userId)
                        : null,
                  ),
          ),
        );
      },
    );
  }
}
