import 'package:flutter/material.dart';
import '../../models/user_profile_model.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfileModel? userProfile;
  final VoidCallback onImageTap;
  final bool isLoading;

  const ProfileHeader({
    super.key,
    required this.userProfile,
    required this.onImageTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Image with Camera Icon
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 2),
              ),
              child: ClipOval(
                child: userProfile?.profilepic != null
                    ? Image.network(
                        _getCacheBustedUrl(userProfile!.profilepic!),
                        key: ValueKey(userProfile!.profilepic),
                        fit: BoxFit.cover,
                        cacheWidth: null,
                        cacheHeight: null,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildDefaultAvatar();
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      )
                    : _buildDefaultAvatar(),
              ),
            ),
            // Loading overlay
            if (isLoading)
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: isLoading ? null : onImageTap,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isLoading
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Name
        Text(
          userProfile?.username ?? 'Brooklyn Simmons',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 4),

        // Phone Number
        Text(
          userProfile?.phoneNumber ?? '7286047246',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  String _getCacheBustedUrl(String url) {
    final uri = Uri.parse(url);
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    // Add timestamp as query parameter
    final newUri = uri.replace(
      queryParameters: {...uri.queryParameters, 't': timestamp.toString()},
    );

    return newUri.toString();
  }

  Widget _buildDefaultAvatar() {
    return const LogoPlaceholder(logoWidth: 40, logoHeight: 40);
  }
}
