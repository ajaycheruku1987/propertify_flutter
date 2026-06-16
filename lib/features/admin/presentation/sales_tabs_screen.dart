import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'manage_projects_screen.dart';
import 'callback_request_screen.dart';

class SalesTabsScreen extends StatelessWidget {
  static const String routeName = '/admin-sales-tabs';

  const SalesTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.pop(),
          ),
          title: const Text(
            'Sales & Projects',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: 'Projects'),
              Tab(text: 'Callback Requests'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ManageProjectsScreen(hideAppBar: true),
            CallbackRequestScreen(hideAppBar: true),
          ],
        ),
      ),
    );
  }
}
