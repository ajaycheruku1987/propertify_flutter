import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/service_locator.dart';
import '../../../core/services/block_service.dart';
import '../../../utils/custom_toast.dart';
import '../../feed/bloc/feed_bloc.dart';

class BlockedAccountsScreen extends StatefulWidget {
  static const String routeName = '/blocked-accounts';

  const BlockedAccountsScreen({super.key});

  @override
  State<BlockedAccountsScreen> createState() => _BlockedAccountsScreenState();
}

class _BlockedAccountsScreenState extends State<BlockedAccountsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final BlockService _blockService = serviceLocator<BlockService>();

  Map<String, String> _blockedUsers = {};
  List<String> _blockedPostIds = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadBlockedData();
  }

  void _loadBlockedData() {
    setState(() {
      _blockedUsers = _blockService.getBlockedUsersMap();
      _blockedPostIds = _blockService.getBlockedPostIds();
    });
  }

  Future<void> _unblockUser(String userId, String userName) async {
    await _blockService.unblockUser(userId);
    _loadBlockedData();
    if (mounted) {
      CustomToast.showSuccessToast(msg: '$userName has been unblocked.');
      context.read<FeedBloc>().add(const FeedEvent.getFeedsEvent(offset: 0));
    }
  }

  Future<void> _unblockPost(String postId) async {
    await _blockService.unblockPost(postId);
    _loadBlockedData();
    if (mounted) {
      CustomToast.showSuccessToast(msg: 'Post has been unhidden.');
      context.read<FeedBloc>().add(const FeedEvent.getFeedsEvent(offset: 0));
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          'Blocked Accounts & Content',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey.shade600,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: const [
            Tab(text: 'Blocked Users'),
            Tab(text: 'Hidden Posts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Blocked Users Tab
          _buildBlockedUsersList(),
          // Hidden Posts Tab
          _buildHiddenPostsList(),
        ],
      ),
    );
  }

  Widget _buildBlockedUsersList() {
    if (_blockedUsers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.block_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No blocked users',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Users you block will appear here',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      );
    }

    final entries = _blockedUsers.entries.toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final userId = entries[index].key;
        final userName = entries[index].value;

        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
            ),
            title: Text(
              userName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              'User ID: ${userId.length > 10 ? '${userId.substring(0, 10)}...' : userId}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            trailing: OutlinedButton(
              onPressed: () => _unblockUser(userId, userName),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Unblock'),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHiddenPostsList() {
    if (_blockedPostIds.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.visibility_off_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No hidden or reported posts',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Posts you report or hide will appear here',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _blockedPostIds.length,
      itemBuilder: (context, index) {
        final postId = _blockedPostIds[index];

        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.orange.withOpacity(0.1),
              child: const Icon(
                Icons.article_outlined,
                color: Colors.orange,
              ),
            ),
            title: const Text(
              'Hidden Property / Post',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              'Post ID: $postId',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            trailing: OutlinedButton(
              onPressed: () => _unblockPost(postId),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                side: BorderSide(color: Theme.of(context).primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Unhide'),
            ),
          ),
        );
      },
    );
  }
}
