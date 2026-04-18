import 'package:flutter/material.dart';
import 'package:propertify/features/reels/models/reel_response_model.dart';

import 'reels_screen.dart';

class OtherUserReelsScreen extends StatefulWidget {
  static const String routeName = '/other-user-reels';

  final List<ReelResponseModel> reels;
  final int initialIndex;

  const OtherUserReelsScreen({
    super.key,
    required this.reels,
    this.initialIndex = 0,
  });

  @override
  State<OtherUserReelsScreen> createState() => _OtherUserReelsScreenState();
}

class _OtherUserReelsScreenState extends State<OtherUserReelsScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.reels.isEmpty) {
      return const Scaffold(body: Center(child: Text('No reels available')));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: widget.reels.length,
        itemBuilder: (context, index) {
          final reel = widget.reels[index];
          return ReelView(
            key: ValueKey(reel.id ?? index.toString()),
            reel: reel,
            showBackButton: true,
          );
        },
      ),
    );
  }
}
