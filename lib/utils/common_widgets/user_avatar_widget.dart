import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:propertify/utils/string_extensions.dart';

class UserAvatarWidget extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final double size;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;

  const UserAvatarWidget({
    super.key,
    this.imageUrl,
    this.name,
    this.size = 40,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final bg = backgroundColor ?? primaryColor.withValues(alpha: 0.15);
    final fg = textColor ?? primaryColor;

    String initial = 'P';
    if (name != null && name!.trim().isNotEmpty) {
      initial = name!.trim()[0].toUpperCase();
    }

    if (imageUrl != null && imageUrl!.trim().isNotEmpty && imageUrl != 'null') {
      return SizedBox(
        width: size,
        height: size,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              width: size,
              height: size,
              color: Colors.grey[200],
              child: Center(
                child: SizedBox(
                  width: size * 0.4,
                  height: size * 0.4,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(fg),
                  ),
                ),
              ),
            ),
            errorWidget: (context, url, error) => _buildInitialAvatar(bg, fg, initial),
          ),
        ),
      );
    }

    return _buildInitialAvatar(bg, fg, initial);
  }

  Widget _buildInitialAvatar(Color bg, Color fg, String initial) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initial,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: fg,
          ),
        ),
      ),
    );
  }
}
