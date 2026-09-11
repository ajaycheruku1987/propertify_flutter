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
  final String? userId; // Optional for backward compatibility
  final VoidCallback? onCallPressed;
  final VoidCallback? onWhatsAppPressed;

  const AgentInfo({
    Key? key,
    required this.agentName,
    required this.agentRole,
    required this.agentImage,
    required this.rating,
    this.userId,
    this.onCallPressed,
    this.onWhatsAppPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            l10n.postedBy,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 16),

          // Agent Info Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                // Agent Avatar
                GestureDetector(
                  onTap: () {
                    if (agentImage.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenImageViewer(
                            images: [agentImage],
                            initialIndex: 0,
                          ),
                        ),
                      );
                    }
                  },
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: agentImage,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[300],
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[300],
                        child: Icon(Icons.person,
                            color: Colors.grey[600], size: 24),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Agent Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        agentName.toTitleCase(),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      if (userId != null && userId!.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            context.push(
                              OtherUserProfileScreen.routeName,
                              extra: userId,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              l10n.viewProfile,
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // Call and WhatsApp Icons
                if (onCallPressed != null)
                  InkWell(
                    onTap: onCallPressed,
                    customBorder: const CircleBorder(),
                    child: Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.phone_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                    ),
                  ),
                if (onWhatsAppPressed != null) ...[
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: onWhatsAppPressed,
                    customBorder: const CircleBorder(),
                    child: Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF25D366).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Color(0xFF25D366),
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
