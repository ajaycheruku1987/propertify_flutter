import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/core/app_theme.dart';
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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'BuilderSmart',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(context),
            const SizedBox(height: 24),
            // const Text(
            //   'Market Trends & Prices',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black87,
            //   ),
            // ),
            // const SizedBox(height: 12),
            // _buildPriceTrackerSection(),
            // const SizedBox(height: 24),
            const Text(
              'Building Insights',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildInsightsGrid(context),
            const SizedBox(height: 32),
            _buildFutureScopeSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Smart Building Decisions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Stay updated with material prices and construction insights.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceTrackerSection() {
    return Column(
      children: [
        _buildPriceCard(
          material: 'Steel (TMT)',
          price: '₹68,500 / Ton',
          trend: '+2.5%',
          isUp: true,
          icon: Icons.architecture,
        ),
        const SizedBox(height: 12),
        _buildPriceCard(
          material: 'Cement (OPC)',
          price: '₹380 / Bag',
          trend: '-1.2%',
          isUp: false,
          icon: Icons.layers,
        ),
        const SizedBox(height: 12),
        _buildPriceCard(
          material: 'Sand (Crushed)',
          price: '₹1,200 / Ton',
          trend: '0.0%',
          isUp: null,
          icon: Icons.grain,
        ),
      ],
    );
  }

  Widget _buildPriceCard({
    required String material,
    required String price,
    required String trend,
    required bool? isUp,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.blueColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppTheme.blueColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  material,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  if (isUp != null)
                    Icon(
                      isUp ? Icons.trending_up : Icons.trending_down,
                      color: isUp ? Colors.red : Colors.green,
                      size: 16,
                    ),
                  const SizedBox(width: 4),
                  Text(
                    trend,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isUp == null
                          ? Colors.grey
                          : (isUp ? Colors.red : Colors.green),
                    ),
                  ),
                ],
              ),
              const Text(
                'This Week',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInsightsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: [
        _buildInsightCard(
          context,
          'Cost Estimator',
          Icons.calculate_outlined,
          () => context.push(CostEstimatorScreen.routeName),
        ),
        _buildInsightCard(
          context,
          'Quality Guide',
          Icons.verified_outlined,
          () => context.push(QualityGuideScreen.routeName),
        ),
        _buildInsightCard(
          context,
          'Vastu Tips',
          Icons.home_outlined,
          () => context.push(VastuTipsScreen.routeName),
        ),
        _buildInsightCard(
          context,
          'Contractors',
          Icons.engineering_outlined,
          () => context.go('${HomeScreen.routeName}?tab=services'),
        ),
      ],
    );
  }

  Widget _buildInsightCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).primaryColor, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFutureScopeSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.shade100),
      ),
      child: Column(
        children: [
          Icon(Icons.shopping_cart_outlined, color: Colors.orange[800], size: 32),
          const SizedBox(height: 12),
          Text(
            'Coming Soon: Material Marketplace',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.orange[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Soon you will be able to buy Steel, Cement, and other building materials directly from top manufacturers at wholesale prices.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.orange[800],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
