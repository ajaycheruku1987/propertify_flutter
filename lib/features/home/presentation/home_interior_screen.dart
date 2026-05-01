import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/requests/presentation/create_request_details.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import '../../../core/app_theme.dart';

class HomeInteriorScreen extends StatefulWidget {
  static const String routeName = '/home-interior';
  const HomeInteriorScreen({super.key});

  @override
  State<HomeInteriorScreen> createState() => _HomeInteriorScreenState();
}

class _HomeInteriorScreenState extends State<HomeInteriorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Home Interior',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Promotional Banner
              _buildPromotionalBanner(),
              const SizedBox(height: 24),

              // Statistics Cards
              _buildStatisticsCards(),
              const SizedBox(height: 24),

              // Description Section
              _buildDescriptionSection(),
              const SizedBox(height: 32),

              // Create Request Button
              _buildCreateRequestButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromotionalBanner() {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),

          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.5),
            ],
          ),
          image: const DecorationImage(
            image: AssetImage('assets/images/home_interior.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.4),
              ],
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Upto 25% OFF',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    const TextSpan(
                      text: 'on ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: 'Home Interior',
                      style: TextStyle(color: AppTheme.blueColor),
                    ),
                    const TextSpan(
                      text: ' Designs',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Limited time offer on premium interior designs',
                style: TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text(
                      'Currently available only in Hyderabad',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticsCards() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.business_center_outlined,
                value: '2000+',
                label: 'Interior Projects',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatCard(
                icon: Icons.people_outline,
                value: '200+',
                label: 'Experts',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.location_city_outlined,
                value: '12+',
                label: 'Cities Covered',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatCard(
                icon: Icons.design_services_outlined,
                value: '1 Lakhs',
                label: 'Design Options',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.blueColor, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildDescriptionItem(
          'Transform your living spaces with our expert interior design solutions tailored to your lifestyle and preferences.',
        ),
        const SizedBox(height: 12),
        _buildDescriptionItem(
          'From concept to completion, we handle every detail including furniture selection, color schemes, lighting, and space planning.',
        ),
        const SizedBox(height: 12),
        _buildDescriptionItem(
          'Our certified designers work closely with you to create functional and aesthetically pleasing environments that reflect your personality.',
        ),
        const SizedBox(height: 12),
        _buildDescriptionItem(
          'Enjoy end-to-end project management with transparent pricing, timely delivery, and quality assurance for complete peace of mind.',
        ),
      ],
    );
  }

  Widget _buildDescriptionItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: AppTheme.blueColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateRequestButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: CommonCustomButton(
        onTap: () {
          context.push(
            CreateRequestDetails.routeName,
            extra: 'Interior Design',
          );
        },
        buttonLabel: 'Create Request',
      ),
    );
  }
}
