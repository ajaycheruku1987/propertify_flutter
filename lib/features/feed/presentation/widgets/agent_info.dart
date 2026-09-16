import 'package:propertify/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/feed/presentation/widgets/full_screen_image_viewer.dart';
import 'package:propertify/features/profile/presentation/other_user_profile_screen.dart';
import 'package:propertify/utils/string_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgentInfo extends StatelessWidget {
  final String agentName;
  final String agentRole;
  final String agentImage;
  final String rating;
  final String? userId;
  final String? memberSince;
  final int? itemsListed;
  final VoidCallback? onCallPressed;
  final VoidCallback? onWhatsAppPressed;

  const AgentInfo({
    super.key,
    required this.agentName,
    required this.agentRole,
    required this.agentImage,
    required this.rating,
    this.userId,
    this.memberSince,
    this.itemsListed,
    this.onCallPressed,
    this.onWhatsAppPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (userId != null && userId!.isNotEmpty) {
              context.push(
                OtherUserProfileScreen.routeName,
                extra: userId,
              );
            }
          },
          borderRadius: BorderRadius.circular(20),
          mouseCursor: SystemMouseCursors.click,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FE),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.05),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.03),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    // Agent Avatar
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: agentImage,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          memCacheWidth: 180,
                          maxWidthDiskCache: 200,
                          fadeInDuration: const Duration(milliseconds: 300),
                          placeholder: (context, url) => Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[100],
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[200],
                            child: Icon(Icons.person,
                                color: Colors.grey[400], size: 30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Agent Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.postedBy.toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            agentName.toTitleCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF1A1A1A),
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            memberSince != null && memberSince!.isNotEmpty
                                ? 'Member since $memberSince'
                                : 'New Member',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Action Buttons (Luxurious Style)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (onCallPressed != null)
                          _buildActionButton(
                            icon: Icons.phone_in_talk_rounded,
                            color: Theme.of(context).primaryColor,
                            onTap: onCallPressed!,
                          ),
                        const SizedBox(width: 8),
                        if (onWhatsAppPressed != null)
                          _buildActionButton(
                            icon: FontAwesomeIcons.whatsapp,
                            color: const Color(0xFF25D366),
                            onTap: onWhatsAppPressed!,
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _buildStatItem(
                            label: 'Total Listings',
                            value: '${itemsListed ?? 0}',
                            context: context,
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey.shade200,
                          thickness: 1,
                          indent: 8,
                          endIndent: 8,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              if (userId != null && userId!.isNotEmpty) {
                                context.push(
                                  OtherUserProfileScreen.routeName,
                                  extra: userId,
                                );
                              }
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  color: Theme.of(context).primaryColor,
                                  size: 26,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'VIEW PROFILE',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required dynamic icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: icon is FaIconData
            ? FaIcon(icon as FaIconData, color: color, size: 18)
            : Icon(icon, color: color, size: 20),
      ),
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required BuildContext context,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
