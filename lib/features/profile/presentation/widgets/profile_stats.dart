import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final int postsCount;
  final int viewsCount;
  final int enquiresCount;
  final int soldsCount;

  const ProfileStats({
    super.key,
    required this.postsCount,
    required this.viewsCount,
    required this.enquiresCount,
    required this.soldsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(
            count: postsCount,
            label: 'Posts',
          ),
          _buildDivider(),
          _buildStatItem(
            count: viewsCount,
            label: 'Views',
          ),
          _buildDivider(),
          _buildStatItem(
            count: enquiresCount,
            label: 'Enquires',
          ),
          _buildDivider(),
          _buildStatItem(
            count: soldsCount,
            label: 'Solds',
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required int count,
    required String label,
  }) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.grey.shade300,
    );
  }
}