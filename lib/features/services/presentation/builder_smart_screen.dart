import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/services/presentation/insights/cost_estimator_screen.dart';
import 'package:propertify/features/services/presentation/insights/quality_guide_screen.dart';
import 'package:propertify/features/services/presentation/insights/vastu_tips_screen.dart';
import 'package:propertify/features/home/presentation/home_screen.dart';

class BuilderSmartScreen extends StatelessWidget {
  static const String routeName = '/builder-smart';

  const BuilderSmartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'BuilderSmart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMinimizedHero(context),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Building Insights',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Expert Guidance',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildCompactGrid(context),
            const SizedBox(height: 24),
            _buildCompactFutureSection(context),
            const SizedBox(height: 24),
            _buildDisclaimerSection(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDisclaimerSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: Colors.grey[600], size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Disclaimer: Building insights and tips are sourced from the internet for informational purposes. They may not be 100% accurate or applicable to every situation. Please consult a professional before making construction decisions.',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMinimizedHero(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Smart Decisions',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Material prices & expert insights.',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.lightbulb_outline,
            color: Theme.of(context).primaryColor,
            size: 28,
          ),
        ],
      ),
    );
  }

  Widget _buildCompactGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 2.2,
      children: [
        _buildCompactCard(
          context,
          'Cost Estimator',
          Icons.calculate_outlined,
          Colors.blue,
          () => context.push(CostEstimatorScreen.routeName),
        ),
        _buildCompactCard(
          context,
          'Quality Guide',
          Icons.verified_outlined,
          Colors.green,
          () => context.push(QualityGuideScreen.routeName),
        ),
        _buildCompactCard(
          context,
          'Vastu Tips',
          Icons.explore_outlined,
          Colors.orange,
          () => context.push(VastuTipsScreen.routeName),
        ),
        _buildCompactCard(
          context,
          'Contractors',
          Icons.engineering_outlined,
          Colors.purple,
          () => context.go('${HomeScreen.routeName}?tab=services'),
        ),
      ],
    );
  }

  Widget _buildCompactCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactFutureSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.shopping_bag_outlined, color: Colors.orange[800], size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Material Marketplace',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[900],
                  ),
                ),
                Text(
                  'Wholesale prices coming soon!',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange[800],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.orange[200], size: 14),
        ],
      ),
    );
  }
}
