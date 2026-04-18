import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/profile/presentation/other_user_profile_screen.dart';
import 'package:propertify/utils/string_extensions.dart';

class AgentInfo extends StatelessWidget {
  final String agentName;
  final String agentRole;
  final String agentImage;
  final String rating;
  final String? userId; // Optional for backward compatibility

  const AgentInfo({
    Key? key,
    required this.agentName,
    required this.agentRole,
    required this.agentImage,
    required this.rating,
    this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          const Text(
            'Posted By',
            style: TextStyle(
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
                Container(
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
                      const SizedBox(height: 4),
                      Text(
                        agentRole,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                // View Profile Button
                if (userId != null && userId!.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      context.push(
                        OtherUserProfileScreen.routeName,
                        extra: userId,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'View Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

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
