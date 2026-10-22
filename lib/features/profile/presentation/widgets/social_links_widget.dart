import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../utils/custom_toast.dart';
import '../../bloc/profile_bloc.dart';
import '../../models/user_profile_model.dart';

class SocialPlatform {
  final String key;
  final String label;
  final dynamic icon;
  final Color color;
  final String? Function(UserProfileModel? profile) getUrl;

  const SocialPlatform({
    required this.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.getUrl,
  });
}

class SocialLinksWidget extends StatelessWidget {
  final UserProfileModel? userProfile;
  final bool isOwner;

  static const List<SocialPlatform> platforms = [
    SocialPlatform(
      key: 'facebook',
      label: 'Facebook',
      icon: FontAwesomeIcons.facebook,
      color: Color(0xFF1877F2),
      getUrl: _getFacebookUrl,
    ),
    SocialPlatform(
      key: 'instagram',
      label: 'Instagram',
      icon: FontAwesomeIcons.instagram,
      color: Color(0xFFE4405F),
      getUrl: _getInstagramUrl,
    ),
    SocialPlatform(
      key: 'whatsapp',
      label: 'WhatsApp Channel',
      icon: FontAwesomeIcons.whatsapp,
      color: Color(0xFF25D366),
      getUrl: _getWhatsappUrl,
    ),
    SocialPlatform(
      key: 'website',
      label: 'Website',
      icon: FontAwesomeIcons.globe,
      color: Color(0xFF0288D1),
      getUrl: _getWebsiteUrl,
    ),
    SocialPlatform(
      key: 'x',
      label: 'X (Twitter)',
      icon: FontAwesomeIcons.xTwitter,
      color: Color(0xFF14171A),
      getUrl: _getXUrl,
    ),
    SocialPlatform(
      key: 'youtube',
      label: 'YouTube',
      icon: FontAwesomeIcons.youtube,
      color: Color(0xFFFF0000),
      getUrl: _getYoutubeUrl,
    ),
  ];

  static String? _getFacebookUrl(UserProfileModel? profile) =>
      profile?.facebookUrl;
  static String? _getInstagramUrl(UserProfileModel? profile) =>
      profile?.instagramUrl;
  static String? _getWhatsappUrl(UserProfileModel? profile) =>
      profile?.whatsappChannelUrl;
  static String? _getWebsiteUrl(UserProfileModel? profile) =>
      profile?.websiteUrl;
  static String? _getXUrl(UserProfileModel? profile) => profile?.xUrl;
  static String? _getYoutubeUrl(UserProfileModel? profile) =>
      profile?.youtubeUrl;

  const SocialLinksWidget({
    super.key,
    required this.userProfile,
    required this.isOwner,
  });

  @override
  Widget build(BuildContext context) {
    if (isOwner) {
      return _buildOwnerView(context);
    } else {
      return _buildCustomerView(context);
    }
  }

  // ==================== CUSTOMER VIEW ====================
  // Shows ONLY social icons that have valid non-empty links
  Widget _buildCustomerView(BuildContext context) {
    final activePlatforms = platforms.where((platform) {
      final url = platform.getUrl(userProfile);
      return url != null && url.trim().isNotEmpty;
    }).toList();

    if (activePlatforms.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Connect With Me',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: activePlatforms.map((platform) {
              final url = platform.getUrl(userProfile)!;
              return _buildCustomerSocialButton(
                context,
                platform: platform,
                url: url,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerSocialButton(
    BuildContext context, {
    required SocialPlatform platform,
    required String url,
  }) {
    return Tooltip(
      message: platform.label,
      child: InkWell(
        onTap: () => _launchUrl(url),
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: platform.color.withOpacity(0.08),
            shape: BoxShape.circle,
            border: Border.all(color: platform.color.withOpacity(0.2), width: 1.2),
          ),
          child: Center(
            child: FaIcon(platform.icon, color: platform.color, size: 22),
          ),
        ),
      ),
    );
  }

  // ==================== OWNER VIEW ====================
  // Shows all 6 platforms with Add, Edit, and Delete options
  Widget _buildOwnerView(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.share_rounded, size: 20, color: Colors.blue),
              const SizedBox(width: 8),
              const Text(
                'Social Media Links',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Add links so customers can visit your social pages',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: platforms.length,
            separatorBuilder: (context, index) => const Divider(height: 16),
            itemBuilder: (context, index) {
              final platform = platforms[index];
              final currentUrl = platform.getUrl(userProfile);
              final hasLink = currentUrl != null && currentUrl.trim().isNotEmpty;

              return _buildOwnerPlatformRow(
                context,
                platform: platform,
                currentUrl: currentUrl,
                hasLink: hasLink,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOwnerPlatformRow(
    BuildContext context, {
    required SocialPlatform platform,
    required String? currentUrl,
    required bool hasLink,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: platform.color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: FaIcon(platform.icon, color: platform.color, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                platform.label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                hasLink ? currentUrl! : 'No link added',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: hasLink ? Colors.grey.shade700 : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        if (hasLink) ...[
          IconButton(
            icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.blue),
            tooltip: 'Edit Link',
            onPressed: () => _showAddEditDialog(
              context,
              platform: platform,
              initialUrl: currentUrl,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded,
                size: 20, color: Colors.redAccent),
            tooltip: 'Delete Link',
            onPressed: () => _confirmDeleteLink(context, platform: platform),
          ),
        ] else ...[
          ElevatedButton.icon(
            onPressed: () => _showAddEditDialog(
              context,
              platform: platform,
              initialUrl: null,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: platform.color.withOpacity(0.1),
              foregroundColor: platform.color,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            icon: const Icon(Icons.add, size: 16),
            label: const Text('Add', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ],
    );
  }

  void _showAddEditDialog(
    BuildContext context, {
    required SocialPlatform platform,
    required String? initialUrl,
  }) {
    final controller = TextEditingController(text: initialUrl ?? '');
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              FaIcon(platform.icon, color: platform.color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  initialUrl != null && initialUrl.isNotEmpty
                      ? 'Edit ${platform.label} Link'
                      : 'Add ${platform.label} Link',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: '${platform.label} URL',
                    hintText: 'https://...',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.link),
                  ),
                  keyboardType: TextInputType.url,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a URL';
                    }
                    final trimmed = value.trim();
                    if (!trimmed.contains('.')) {
                      return 'Please enter a valid web address';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  String finalUrl = controller.text.trim();
                  if (!finalUrl.startsWith('http://') &&
                      !finalUrl.startsWith('https://')) {
                    finalUrl = 'https://$finalUrl';
                  }

                  Navigator.pop(dialogContext);
                  _saveSocialLink(context, platform: platform, url: finalUrl);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteLink(
    BuildContext context, {
    required SocialPlatform platform,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Remove Social Link'),
          content: Text(
            'Are you sure you want to remove your ${platform.label} link?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(dialogContext);
                _saveSocialLink(context, platform: platform, url: '');
              },
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  void _saveSocialLink(
    BuildContext context, {
    required SocialPlatform platform,
    required String url,
  }) {
    final currentProfile = userProfile;

    String? fb = currentProfile?.facebookUrl;
    String? insta = currentProfile?.instagramUrl;
    String? wa = currentProfile?.whatsappChannelUrl;
    String? web = currentProfile?.websiteUrl;
    String? x = currentProfile?.xUrl;
    String? yt = currentProfile?.youtubeUrl;

    switch (platform.key) {
      case 'facebook':
        fb = url;
        break;
      case 'instagram':
        insta = url;
        break;
      case 'whatsapp':
        wa = url;
        break;
      case 'website':
        web = url;
        break;
      case 'x':
        x = url;
        break;
      case 'youtube':
        yt = url;
        break;
    }

    context.read<ProfileBloc>().add(
          ProfileEvent.updateSocialLinks(
            facebookUrl: fb,
            instagramUrl: insta,
            whatsappChannelUrl: wa,
            websiteUrl: web,
            xUrl: x,
            youtubeUrl: yt,
          ),
        );
  }

  static Future<void> _launchUrl(String url) async {
    String formattedUrl = url.trim();
    if (!formattedUrl.startsWith('http://') &&
        !formattedUrl.startsWith('https://')) {
      formattedUrl = 'https://$formattedUrl';
    }

    final Uri uri = Uri.parse(formattedUrl);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        CustomToast.showErrorToast(msg: 'Could not launch link');
      }
    } catch (e) {
      CustomToast.showErrorToast(msg: 'Error launching link: $e');
    }
  }
}
