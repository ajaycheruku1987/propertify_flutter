import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'admin_companies_screen.dart';
import 'gst_verification_requests_screen.dart';

class CompaniesTabsScreen extends StatelessWidget {
  static const String routeName = '/admin-companies-tabs';

  const CompaniesTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.pop(),
          ),
          title: const Text(
            'Companies Management',
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
              Tab(text: 'All Companies'),
              Tab(text: 'Pending GST'),
              Tab(text: 'Verified GST'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdminCompaniesScreen(hideAppBar: true),
            GstVerificationRequestsScreen(hideAppBar: true),
            GstVerificationRequestsScreen(hideAppBar: true, status: 'approved'),
          ],
        ),
      ),
    );
  }
}
