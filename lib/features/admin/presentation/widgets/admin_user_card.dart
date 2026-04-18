import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import 'package:propertify/utils/string_extensions.dart';

class AdminUserCard extends StatelessWidget {
  final UserModel user;
  final bool isSelected;
  final bool isSelectionMode;
  final VoidCallback? onProfileTap;

  const AdminUserCard({
    super.key,
    required this.user,
    this.isSelected = false,
    this.isSelectionMode = false,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final role = user.role ?? '';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Admin/Seller Icon with selection indicator or gear overlay - tappable
            GestureDetector(
              onTap: onProfileTap,
              child: Stack(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_outline,
                      color: theme.primaryColor,
                      size: 24,
                    ),
                  ),
                  if (isSelectionMode)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? theme.primaryColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? theme.primaryColor
                                : Colors.grey,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          isSelected ? Icons.check : Icons.circle,
                          color: isSelected ? Colors.white : Colors.transparent,
                          size: 12,
                        ),
                      ),
                    )
                  else
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.settings,
                          size: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (user.username ?? user.phoneNumber ?? '').toTitleCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${user.phoneNumber ?? ''} • ${role.toTitleCase()}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
