import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/admin/bloc/admin_bloc.dart'; // Verify this import
import 'package:propertify/utils/custom_toast.dart';
import '../../reels/models/reel_response_model.dart';
import '../../reels/presentation/reels_screen.dart';

class AdminReelsScreen extends StatefulWidget {
  static const String routeName = '/admin-reels';

  const AdminReelsScreen({super.key});

  @override
  State<AdminReelsScreen> createState() => _AdminReelsScreenState();
}

class _AdminReelsScreenState extends State<AdminReelsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadReels();
    _scrollController.addListener(_onScroll);
  }

  void _loadReels() {
    context.read<AdminBloc>().add(
      const AdminEvent.getAdminReels(page: 1, limit: 30),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final state = context.read<AdminBloc>().state;
      if (!state.isLoading && state.hasMoreAdminReels) {
        context.read<AdminBloc>().add(
          AdminEvent.getAdminReels(
            page: state.currentAdminReelsPage + 1,
            limit: 30,
          ),
        );
      }
    }
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
          'Manage Reels',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          if (state.isLoading && (state.adminReels?.isEmpty ?? true)) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.adminReels?.isEmpty ?? true) {
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
            itemCount:
                state.adminReels!.length + (state.hasMoreAdminReels ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == state.adminReels!.length) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              }

              final reel = state.adminReels![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminReelsDetailScreen(
                        reels: state.adminReels!,
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
                      // We could use a thumbnail here if available,
                      // but ReelResponseModel doesn't seem to have a dedicated thumbnail URL separate from videoUrl.
                      // VideoPlayerController in ReelView handles this by loading the video.
                      // For a lightweight grid, we might show a placeholder icon or try to use a thumbnail generator if supported.
                      // Since existing implementation uses simple icon in cached version placeholder, we'll stick to simple UI or try to load something if available.
                      // OtherUserProfileScreen uses a simple icon placeholder for Reels if no thumbnail logic is apparent in the snippet (re-reading Step 82: it uses an Icon(Icons.play_circle_outline) inside a grey container).
                      // I will replicate that behavior.
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

class AdminReelsDetailScreen extends StatefulWidget {
  final List<ReelResponseModel> reels;
  final int initialIndex;

  const AdminReelsDetailScreen({
    super.key,
    required this.reels,
    required this.initialIndex,
  });

  @override
  State<AdminReelsDetailScreen> createState() => _AdminReelsDetailScreenState();
}

class _AdminReelsDetailScreenState extends State<AdminReelsDetailScreen> {
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
      body: BlocConsumer<AdminBloc, AdminState>(
        listener: (context, state) {
          if (state.notifyStatus?.message == 'Reel deleted successfully') {
            CustomToast.showSuccessToast(msg: 'Reel deleted successfully').then(
              (value) {
                Navigator.pop(context);
              },
            );
          }
        },
        builder: (context, state) {
          final reels = state.adminReels ?? widget.reels;
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
            onPageChanged: (index) {},
            itemBuilder: (context, index) {
              // Safety check for index
              if (index >= reels.length) return const SizedBox.shrink();
              return ReelView(
                reel: reels[index],
                showBackButton: true,
                isFromAdmin: true,
              );
            },
          );
        },
      ),
    );
  }
}
