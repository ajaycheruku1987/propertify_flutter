import 'package:propertify/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/feed/presentation/widgets/full_screen_image_viewer.dart';
import 'package:propertify/features/profile/presentation/other_user_profile_screen.dart';
import 'package:propertify/utils/string_extensions.dart';

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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 16),

          // Agent Info Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!, width: 1),
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
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                      image: agentImage.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(agentImage),
                              fit: BoxFit.cover,
                              onError: (exception, stackTrace) {
                                // Handle image loading error
                              },
                            )
                          : null,
                    ),
                    child: agentImage.isEmpty
                        ? Icon(Icons.person, color: Colors.grey[600], size: 24)
                        : null,
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
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
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
                              l10n.editProfile, // or add a viewProfile key if available. editProfile is close enough if translating to "View Profile"
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

                // Rating and View Button
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     // Rating
                //     Container(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 8,
                //         vertical: 4,
                //       ),
                //       decoration: BoxDecoration(
                //         color: const Color(0xFF6C5CE7),
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       child: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           const Icon(
                //             Icons.visibility,
                //             color: Colors.white,
                //             size: 12,
                //           ),
                //           const SizedBox(width: 4),
                //           Text(
                //             rating,
                //             style: const TextStyle(
                //               color: Colors.white,
                //               fontSize: 12,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),

                //     const SizedBox(height: 8),

                //     // View Count
                //     Text(
                //       '234',
                //       style: TextStyle(
                //         fontSize: 12,
                //         color: Colors.grey[600],
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
