import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/reels/bloc/reels_bloc.dart';
import 'package:propertify/features/reels/presentation/reels_screen.dart';

import 'package:propertify/features/reels/models/reel_response_model.dart';
import 'package:propertify/utils/custom_toast.dart';

class MyReelsScreen extends StatefulWidget {
  static const String routeName = '/my-reels';

  const MyReelsScreen({super.key});

  @override
  State<MyReelsScreen> createState() => _MyReelsScreenState();
}

class _MyReelsScreenState extends State<MyReelsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ReelsBloc>().add(const ReelsEvent.getMyReels());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Reels',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<ReelsBloc, ReelsState>(
        builder: (context, state) {
          if (state.isLoadingMyReels && state.myReels.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.myReels.isEmpty) {
            return const Center(
              child: Text(
                'No reels found',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.6,
            ),
            itemCount: state.myReels.length,
            itemBuilder: (context, index) {
              final reel = state.myReels[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyReelsDetailScreen(
                        reels: state.myReels,
                        initialIndex: index,
                      ),
                    ),
                  );
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                    if (reel.isPromoted ?? false)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                          child: const Icon(
                            Icons.star,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 4,
                      left: 4,
                      child: Text(
                        '${reel.viewsCount ?? 0} views',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MyReelsDetailScreen extends StatefulWidget {
  final List<ReelResponseModel> reels;
  final int initialIndex;

  const MyReelsDetailScreen({
    super.key,
    required this.reels,
    required this.initialIndex,
  });

  @override
  State<MyReelsDetailScreen> createState() => _MyReelsDetailScreenState();
}

class _MyReelsDetailScreenState extends State<MyReelsDetailScreen> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<ReelsBloc, ReelsState>(
        listener: (context, state) {
          if (state.notifyStatus?.message == 'Reel deleted successfully') {
            CustomToast.showSuccessToast(msg: 'Reel deleted successfully').then(
              (value) {
                // Return to grid on delete
                Navigator.pop(context);
              },
            );
          }
        },
        builder: (context, state) {
          // We use the passed reels initially, but really we should be observing the bloc's myReels to be safe
          // However, for consistency with the admin deletion flow requested ("same functionality"),
          // we pop on delete.
          // The PageView should use the updated list from state if available, but since we pop on delete,
          // the immediate visual update isn't as critical as avoiding crashes.
          // Let's use state.myReels if available and non-empty, else fallback or show empty.
          final reels = state.myReels.isNotEmpty ? state.myReels : widget.reels;

          if (reels.isEmpty) {
            return const Center(
              child: Text(
                'No reels found',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: reels.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              if (index >= reels.length) return const SizedBox.shrink();
              final reel = reels[index];
              return ReelView(
                key: ValueKey(reel.id ?? index.toString()),
                reel: reel,
                showBackButton: true,
                isFromAdmin:
                    false, // isOwner check inside ReelView is sufficient for delete button
              );
            },
          );
        },
      ),
    );
  }
}
