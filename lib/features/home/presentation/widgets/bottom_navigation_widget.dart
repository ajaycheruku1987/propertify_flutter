import 'package:flutter/material.dart';
import '../../../../core/app_theme.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final bool isLoggedIn;
  final Function(int) onItemTapped;

  const BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
    required this.isLoggedIn,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              _buildNavItem(
                index: 0,
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: 'Home',
              ),
              _buildNavItem(
                index: 1,
                icon: Icons.smart_display_outlined,
                activeIcon: Icons.smart_display,
                label: 'Reels',
              ),
              const SizedBox(width: 60), // Space for FAB
              _buildNavItem(
                index: 2,
                icon: Icons.favorite_border,
                activeIcon: Icons.favorite,
                label: 'Favorite',
              ),
              _buildNavItem(
                index: 3,
                icon: Icons.person_outline_outlined,
                activeIcon: Icons.person,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => onItemTapped(index),
        splashColor: AppTheme.blueColor.withOpacity(0.1),
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Selection Indicator
              Container(
                height: 2,
                width: 20,
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.blueColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              const SizedBox(height: 8),
              Icon(
                isSelected ? activeIcon : icon,
                color: isSelected ? AppTheme.blueColor : Colors.grey.shade500,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? AppTheme.blueColor : Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
