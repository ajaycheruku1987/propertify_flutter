import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'package:propertify/features/profile/presentation/other_user_profile_screen.dart';
import 'package:video_player/video_player.dart';
import '../../../../reels/bloc/reels_bloc.dart';
import '../../../../reels/models/reel_response_model.dart';

class OwnerReelsSection extends StatelessWidget {
  final String ownerName;
  final String? userId;

  const OwnerReelsSection({
    super.key,
    required this.ownerName,
    this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return BlocBuilder<ReelsBloc, ReelsState>(
      builder: (context, state) {
        if (state.isLoadingOtherUserReels) {
          return const SizedBox.shrink(); // Hide while loading or show a tiny loader
        }

        final reels = state.otherUserReels;
        if (reels.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  if (userId != null && userId!.isNotEmpty) {
                    context.push(
                      OtherUserProfileScreen.routeName,
                      extra: userId,
                    );
                  }
                },
                child: Row(
                  children: [
                    const Icon(Icons.movie_outlined, size: 20, color: Colors.black87),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${l10n.reels} by $ownerName',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 280,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: reels.length,
                itemBuilder: (context, index) {
                  return _OwnerReelCard(reel: reels[index]);
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

class _OwnerReelCard extends StatefulWidget {
  final ReelResponseModel reel;

  const _OwnerReelCard({Key? key, required this.reel}) : super(key: key);

  @override
  State<_OwnerReelCard> createState() => _OwnerReelCardState();
}

class _OwnerReelCardState extends State<_OwnerReelCard> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.reel.videoUrl ?? ''),
    )..initialize().then((_) {
        if (mounted) {
          setState(() => _initialized = true);
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.reel.id != null) {
          context.push('/reels?reelId=${widget.reel.id}');
        }
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (_initialized)
                FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                )
              else
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),

              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                ),
              ),

              // Play button overlay
              const Center(
                child: Icon(
                  Icons.play_circle_outline,
                  size: 40,
                  color: Colors.white,
                ),
              ),

              // View count
              Positioned(
                bottom: 12,
                left: 12,
                child: Row(
                  children: [
                    const Icon(Icons.play_arrow, size: 14, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.reel.viewsCount ?? 0}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
