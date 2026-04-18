import 'package:flutter/material.dart';
import 'package:propertify/utils/env.dart';

class FullscreenWidget extends StatelessWidget {
  final String imageUrl;
  const FullscreenWidget({super.key, required this.imageUrl});

  static Future<void> open(BuildContext context, {required String imageUrl}) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'fullscreen',
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Material(
          type: MaterialType.transparency,
          child: FullscreenWidget(imageUrl: imageUrl),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final resolvedUrl = imageUrl.startsWith('http')
        ? imageUrl
        : '${env.baseUrl.replaceAll('api', '')}$imageUrl';

    return Stack(
      children: [
        Positioned.fill(child: Container(color: Colors.black)),
        SafeArea(
          child: Center(
            child: InteractiveViewer(
              minScale: 0.8,
              maxScale: 4,
              child: Image.network(resolvedUrl, fit: BoxFit.contain),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
