import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/features/services/models/material_price_model.dart';
import 'package:propertify/features/services/presentation/insights/cost_estimator_screen.dart';
import 'package:propertify/features/services/presentation/insights/quality_guide_screen.dart';
import 'package:propertify/features/services/presentation/insights/vastu_tips_screen.dart';
import 'package:propertify/features/home/presentation/home_screen.dart';

class BuilderSmartScreen extends StatefulWidget {
  static const String routeName = '/builder-smart';

  const BuilderSmartScreen({super.key});

  @override
  State<BuilderSmartScreen> createState() => _BuilderSmartScreenState();
}

class _BuilderSmartScreenState extends State<BuilderSmartScreen> {
  int _selectedPriceIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<ServicesBloc>().add(const ServicesEvent.getMaterialPricesEvent());
  }

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
      body: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                      'Market Price Tracker',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    if (state.isMaterialPricesLoading)
                      const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    else
                      InkWell(
                        onTap: () => context.read<ServicesBloc>().add(const ServicesEvent.getMaterialPricesEvent(force: true)),
                        child: Text(
                          'Refresh Trends',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildCompactPriceTracker(state.materialPrices),
                if (state.materialPrices.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _buildPriceHistoryChart(state.materialPrices[_selectedPriceIndex]),
                ],
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
          );
        },
      ),
    );
  }

  Widget _buildMinimizedHero(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha: 0.1)),
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

  Widget _buildCompactPriceTracker(List<MaterialPrice> prices) {
    if (prices.isEmpty) {
      return const SizedBox(
        height: 60,
        child: Center(
          child: Text(
            'Loading current market prices...',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            prices.asMap().entries.map((entry) {
              final index = entry.key;
              final price = entry.value;
              return GestureDetector(
                onTap: () => setState(() => _selectedPriceIndex = index),
                behavior: HitTestBehavior.opaque,
                child: _buildPriceChip(
                  material: price.name,
                  price: price.price,
                  trend: price.trend,
                  isUp: price.isUp,
                  icon: price.icon,
                  isSelected: _selectedPriceIndex == index,
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildPriceChip({
    required String material,
    required String price,
    required String trend,
    required bool? isUp,
    required IconData icon,
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade200,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                material,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                price,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: (isUp == null ? Colors.grey : (isUp ? Colors.red : Colors.green)).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              trend,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isUp == null ? Colors.grey : (isUp ? Colors.red : Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceHistoryChart(MaterialPrice material) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${material.name} Price Trend (6 Months)',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          Expanded(
            child: SfCartesianChart(
              key: ValueKey(material.name),
              margin: EdgeInsets.zero,
              plotAreaBorderWidth: 0,
              primaryXAxis: DateTimeAxis(
                majorGridLines: const MajorGridLines(width: 0),
                dateFormat: DateFormat.MMM(),
                intervalType: DateTimeIntervalType.months,
                labelStyle: const TextStyle(fontSize: 10),
              ),
              primaryYAxis: NumericAxis(
                isVisible: false,
                rangePadding: ChartRangePadding.auto,
              ),
              series: <CartesianSeries<PricePoint, DateTime>>[
                SplineAreaSeries<PricePoint, DateTime>(
                  dataSource: material.history,
                  xValueMapper: (PricePoint data, _) => data.date,
                  yValueMapper: (PricePoint data, _) => data.price,
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                  borderColor: Theme.of(context).primaryColor,
                  borderWidth: 2,
                  markerSettings: const MarkerSettings(isVisible: true, width: 4, height: 4),
                ),
              ],
              trackballBehavior: TrackballBehavior(
                enable: true,
                activationMode: ActivationMode.singleTap,
                tooltipSettings: const InteractiveTooltip(
                  enable: true,
                  format: 'point.x : point.y',
                  decimalPlaces: 0,
                ),
                lineType: TrackballLineType.vertical,
              ),
            ),
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
              'Disclaimer: These building insights are collected from various internet sources and may be right or wrong. Please verify with a professional before making construction decisions.',
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
}
