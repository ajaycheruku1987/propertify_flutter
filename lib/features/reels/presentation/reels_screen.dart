import 'dart:ui' as ui;
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/reels/models/reel_response_model.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/core/content_type.dart';
import 'package:propertify/utils/common_widgets/select_plan_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/reels_bloc.dart';
import 'widgets/reel_comments_bottom_sheet.dart';
import '../../profile/bloc/profile_bloc.dart';
import '../../profile/presentation/other_user_profile_screen.dart';
import '../../admin/bloc/admin_bloc.dart';
import '../../../../utils/string_extensions.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_handleSearchFieldChange);
    _searchFocusNode.addListener(_handleSearchFieldChange);
    _loadReels();
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_handleSearchFieldChange)
      ..dispose();
    _searchFocusNode
      ..removeListener(_handleSearchFieldChange)
      ..dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _handleSearchFieldChange() {
    if (mounted) {
      setState(() {});
    }
  }

  void _loadReels({String? query}) {
    context.read<ReelsBloc>().add(ReelsEvent.getReels(limit: 5, search: query));
  }

  void _submitSearch([String? query]) {
    final String trimmedQuery = (query ?? _searchController.text).trim();
    _currentIndex = 0;

    if (_pageController.hasClients) {
      _pageController.jumpToPage(0);
    }

    context.read<ReelsBloc>().add(
      const ReelsEvent.getSearchSuggestions(query: ''),
    );
    _searchFocusNode.unfocus();
    _loadReels(query: trimmedQuery.isEmpty ? null : trimmedQuery);
  }

  void _clearSearch() {
    _searchController.clear();
    _currentIndex = 0;

    context.read<ReelsBloc>().add(
      const ReelsEvent.getSearchSuggestions(query: ''),
    );
    _searchFocusNode.unfocus();

    if (_pageController.hasClients) {
      _pageController.jumpToPage(0);
    }

    _loadReels();
  }

  bool _shouldShowSuggestions(ReelsState state) {
    return _searchFocusNode.hasFocus &&
        _searchController.text.trim().isNotEmpty &&
        (state.suggestionsLoading || state.searchSuggestions.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReelsBloc, ReelsState>(
      listener: (context, state) {
        if (state.isError &&
            state.notifyStatus != null &&
            state.notifyStatus!.message.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.notifyStatus!.message),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state.notifyStatus?.message == 'Reel deleted successfully') {
          if (state.reelsList.isEmpty) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          } else {
            if (_currentIndex >= state.reelsList.length) {
              final newIndex = state.reelsList.length - 1;
              _pageController.animateToPage(
                newIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
              _currentIndex = newIndex;
            }
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<ReelsBloc, ReelsState>(
          builder: (context, state) {
            final reels = state.reelsList;

            return Stack(
              children: [
                if (state.isLoading && reels.isEmpty)
                  const Center(child: CircularProgressIndicator())
                else if (reels.isEmpty)
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.video_library_outlined,
                          color: Colors.white24,
                          size: 64,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No reels available',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  )
                else
                  PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: reels.length,
                    onPageChanged: (index) {
                      _currentIndex = index;
                      if (index >= reels.length - 3 &&
                          state.hasMoreData &&
                          !state.isLoading) {
                        context.read<ReelsBloc>().add(
                          ReelsEvent.getReels(
                            skip: state.currentOffset,
                            limit: 5,
                          ),
                        );
                      }
                    },
                    itemBuilder: (context, index) {
                      final reel = reels[index];
                      return ReelView(
                        key: ValueKey(reel.id ?? index.toString()),
                        reel: reel,
                      );
                    },
                  ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildSearchBar(context),
                        if (_shouldShowSuggestions(state)) ...[
                          const SizedBox(height: 8),
                          _buildSuggestions(state),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.55),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        textInputAction: TextInputAction.search,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'Search reels by description, location, or creator',
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: const Icon(Icons.search, color: Colors.white70),
          suffixIcon: _searchController.text.trim().isEmpty
              ? null
              : IconButton(
                  onPressed: _clearSearch,
                  icon: const Icon(Icons.close, color: Colors.white70),
                ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        onChanged: (value) {
          context.read<ReelsBloc>().add(
            ReelsEvent.getSearchSuggestions(query: value.trim()),
          );
        },
        onSubmitted: _submitSearch,
      ),
    );
  }

  Widget _buildSuggestions(ReelsState state) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 260),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: state.suggestionsLoading
          ? const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: CircularProgressIndicator()),
            )
          : ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: state.searchSuggestions.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: Colors.white12),
              itemBuilder: (context, index) {
                final reel = state.searchSuggestions[index];
                final String title = reel.description?.trim().isNotEmpty == true
                    ? reel.description!.trim()
                    : (reel.owner?.username?.trim().isNotEmpty == true
                          ? reel.owner!.username!.trim()
                          : 'Reel');
                final String subtitle = [
                  if (reel.owner?.username?.trim().isNotEmpty == true)
                    '@${reel.owner!.username!.trim()}',
                  if (reel.location?.trim().isNotEmpty == true)
                    reel.location!.trim(),
                ].join(' • ');

                return ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    backgroundColor: Colors.white12,
                    backgroundImage:
                        reel.owner?.profilepic?.trim().isNotEmpty == true
                        ? NetworkImage(reel.owner!.profilepic!.trim())
                        : null,
                    child: reel.owner?.profilepic?.trim().isNotEmpty == true
                        ? null
                        : const Icon(Icons.person, color: Colors.white70),
                  ),
                  title: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: subtitle.isEmpty
                      ? null
                      : Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white60),
                        ),
                  onTap: () {
                    _searchController.text = title;
                    _submitSearch(title);
                  },
                );
              },
            ),
    );
  }
}

class ReelView extends StatefulWidget {
  final ReelResponseModel reel;
  final bool showBackButton;
  final bool isFromAdmin;

  const ReelView({
    required this.reel,
    this.showBackButton = false,
    this.isFromAdmin = false,
    super.key,
  });

  @override
  State<ReelView> createState() => ReelViewState();
}

class ReelViewState extends State<ReelView>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  bool _initialized = false;
  bool _isMuted = false;
  bool _showMuteIcon = false;
  late AnimationController _muteIconController;
  late Animation<double> _muteIconAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for mute icon
    _muteIconController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _muteIconAnimation = CurvedAnimation(
      parent: _muteIconController,
      curve: Curves.easeInOut,
    );

    // Record view for this reel
    if (widget.reel.id != null) {
      context.read<ReelsBloc>().add(
        ReelsEvent.recordReelView(reelId: widget.reel.id!),
      );
    }

    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.reel.videoUrl ?? ''))
          ..setLooping(true)
          ..initialize().then((_) {
            if (mounted) {
              setState(() => _initialized = true);
              _controller.play();
            }
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    _muteIconController.dispose();
    super.dispose();
  }

  void _toggleMute() async {
    if (!_initialized) return;
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0.0 : 1.0);
      _showMuteIcon = true;
    });

    // Animate in
    _muteIconController.forward();

    // Wait and then animate out
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      _muteIconController.reverse();
      await Future.delayed(const Duration(milliseconds: 200));
      if (mounted) {
        setState(() {
          _showMuteIcon = false;
        });
      }
    }
  }

  Widget _buildPromotionDates(ReelResponseModel reel) {
    final DateTime? start = reel.createdAt != null
        ? DateTime.tryParse(reel.createdAt!)
        : null;
    final DateTime? end = reel.promotedUntil != null
        ? DateTime.tryParse(reel.promotedUntil!)
        : null;
    final formatter = DateFormat('MMM d, yyyy');

    if (start == null && end == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.calendar_today, size: 12, color: Colors.white),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (start != null)
                Text(
                  'Start: ${formatter.format(start)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (end != null)
                Text(
                  'Expires: ${formatter.format(end)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleMute,
      behavior: HitTestBehavior.opaque,
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
            const Center(child: CircularProgressIndicator()),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black54,
                ],
              ),
            ),
          ),
          // Center Mute/Unmute Icon (appears on tap)
          if (_showMuteIcon && _initialized)
            Center(
              child: FadeTransition(
                opacity: _muteIconAnimation,
                child: ScaleTransition(
                  scale: _muteIconAnimation,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isMuted ? Icons.volume_off : Icons.volume_up,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
          // Back button (optional)
          if (widget.showBackButton)
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 16,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  customBorder: const CircleBorder(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white24),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),

          // Action Icons (Delete)
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, profileState) {
              final currentUserId = profileState.userProfile?.id;
              final isOwner =
                  currentUserId != null && currentUserId == widget.reel.userId;
              final bool showDelete = widget.isFromAdmin || isOwner;

              // Position calculation
              final double deleteRight = 16;

              return BlocBuilder<ReelsBloc, ReelsState>(
                builder: (context, reelsState) {
                  return Stack(
                    children: [
                      // Delete Button
                      if (showDelete)
                        Positioned(
                          top: MediaQuery.of(context).padding.top + 8,
                          right: deleteRight,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                if (widget.isFromAdmin) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Reel'),
                                      content: const Text(
                                        'Are you sure you want to delete this reel?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context.read<AdminBloc>().add(
                                              AdminEvent.deleteAdminReel(
                                                reelId: widget.reel.id ?? '',
                                              ),
                                            );
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  // User delete reel functionality
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Reel'),
                                      content: const Text(
                                        'Are you sure you want to delete this reel?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            if (widget.reel.id != null) {
                                              context.read<ReelsBloc>().add(
                                                ReelsEvent.deleteReel(
                                                  reelId: widget.reel.id!,
                                                ),
                                              );
                                            }
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              customBorder: const CircleBorder(),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white24),
                                ),
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              );
            },
          ),

          // Promoted Badge & Dates
          if (widget.reel.isCurrentlyPromoted)
            Positioned(
              top: 100,
              right: 16,
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, profileState) {
                  final currentUserId = profileState.userProfile?.id;
                  final isOwner =
                      currentUserId != null &&
                      currentUserId == widget.reel.userId;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.4),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 16),
                            SizedBox(width: 6),
                            Text(
                              'Promoted',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isOwner) ...[
                        const SizedBox(height: 8),
                        _buildPromotionDates(widget.reel),
                      ],
                    ],
                  );
                },
              ),
            ),
          Positioned(
            right: 0,
            bottom: 200,
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, profileState) {
                final currentUserId = profileState.userProfile?.id;
                final isOwner =
                    currentUserId != null &&
                    currentUserId == widget.reel.userId;
                final isPromoted = widget.reel.isCurrentlyPromoted;
                final shouldShowBoost = isOwner && !isPromoted;

                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Boost button - only show for owner and when not promoted
                      if (shouldShowBoost) ...[
                        _ActionButton(
                          icon: Icons.rocket_launch_outlined,
                          label: 'Boost',
                          color: Colors.white,
                          onTap: () {
                            // Navigate to SelectPlanScreen when boost is tapped
                            final reelId = widget.reel.id ?? '';
                            context.push(
                              '${SelectPlanScreen.routeName}?contentType=${ContentType.REEL.value}&contentId=$reelId',
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                      _ActionButton(
                        icon: widget.reel.isLiked == true
                            ? Icons.thumb_up
                            : Icons.thumb_up_alt_outlined,
                        label: widget.reel.likesCount?.toString() ?? '0',
                        color: widget.reel.isLiked == true
                            ? Colors.white
                            : null,
                        onTap: () {
                          if (widget.reel.id != null) {
                            context.read<ReelsBloc>().add(
                              ReelsEvent.toggleLikeReel(
                                reelId: widget.reel.id!,
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      _ActionButton(
                        icon: Icons.mode_comment_outlined,
                        label: widget.reel.commentsCount?.toString() ?? '0',
                        onTap: () {
                          if (widget.reel.id != null) {
                            ReelCommentsBottomSheet.show(
                              context,
                              widget.reel.id!,
                              true,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      _ActionButton(
                        icon: Icons.remove_red_eye_outlined,
                        label: widget.reel.viewsCount?.toString() ?? '0',
                      ),
                      const SizedBox(height: 20),
                      _ActionButton(
                        icon: Icons.phone_outlined,
                        label: '',
                        onTap: () {
                          _showContactBottomSheet(
                            context,
                            widget.reel.owner?.phoneNumber,
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _ActionButton(
                        icon: Icons.share_outlined,
                        label: '',
                        onTap: () {
                          // Prepare share content
                          final String reelDescription =
                              widget.reel.description ?? 'Check out this reel';
                          final String postedBy = () {
                            final owner = widget.reel.owner;
                            if (owner == null) return 'Propertify User';
                            final firstName = owner.firstName?.trim() ?? '';
                            final lastName = owner.lastName?.trim() ?? '';
                            if (firstName.isNotEmpty || lastName.isNotEmpty) {
                              return '$firstName $lastName'.trim();
                            }
                            return owner.username ?? 'Propertify User';
                          }();
                          final String videoUrl = widget.reel.videoUrl ?? '';
                          final String location = widget.reel.location ?? '';

                          // Create formatted message
                          final String shareMessage =
                              '''
🎬 Reel on Propertify

📝 Description:
$reelDescription

👤 Posted by: $postedBy

${location.isNotEmpty ? '📍 Location: $location' : ''}

${videoUrl.isNotEmpty ? '🎥 Video: $videoUrl' : ''}

Check it out on Propertify!

📱 Download the app:
Android: https://play.google.com/store/apps/details?id=com.placeofsalesrealestate
iOS: https://apps.apple.com/in/app/propertify-buy-sell-rent/id6763365054
                        '''
                                  .trim();

                          Share.share(
                            shareMessage,
                            subject: 'Check out this reel',
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: _BottomInfo(reel: widget.reel),
          ),
        ],
      ),
    );
  }

  void _showContactBottomSheet(BuildContext context, String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contact number not available')),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Contact Owner',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          final Uri launchUri = Uri(
                            scheme: 'tel',
                            path: phoneNumber,
                          );
                          launchUrl(launchUri);
                        },
                        icon: const Icon(Icons.phone, color: Colors.white),
                        label: const Text('Call'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6C5CE7),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          Navigator.pop(context);
                          String cleanMobile = phoneNumber.replaceAll(
                            RegExp(r'\D'),
                            '',
                          );
                          var whatsappUrl =
                              "whatsapp://send?phone=$cleanMobile";
                          var uri = Uri.parse(whatsappUrl);

                          try {
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              // Fallback to web
                              final webUri = Uri.parse(
                                'https://wa.me/$cleanMobile',
                              );
                              if (!await launchUrl(
                                webUri,
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw 'Could not launch WhatsApp';
                              }
                            }
                          } catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Could not open WhatsApp'),
                                ),
                              );
                            }
                          }
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.white,
                        ),
                        label: const Text('WhatsApp'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF25D366),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback? onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color ?? Colors.white, size: 28),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    color: Colors.black45,
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _BottomInfo extends StatelessWidget {
  final ReelResponseModel reel;
  const _BottomInfo({required this.reel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Picture - Tappable
        GestureDetector(
          onTap: () {
            if (reel.owner?.id != null) {
              context.push(
                OtherUserProfileScreen.routeName,
                extra: reel.owner!.id,
              );
            }
          },
          child: CircleAvatar(
            backgroundImage:
                reel.owner?.profilepic != null &&
                    reel.owner!.profilepic!.isNotEmpty
                ? NetworkImage(reel.owner!.profilepic!)
                : null,
            child:
                reel.owner?.profilepic == null ||
                    reel.owner!.profilepic!.isEmpty
                ? const Icon(Icons.person)
                : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Username - Tappable
                  GestureDetector(
                    onTap: () {
                      if (reel.owner?.id != null) {
                        context.push(
                          OtherUserProfileScreen.routeName,
                          extra: reel.owner!.id,
                        );
                      }
                    },
                    child: Text(
                      () {
                        final owner = reel.owner;
                        if (owner == null) return 'Propertify User';
                        final firstName = owner.firstName?.trim() ?? '';
                        final lastName = owner.lastName?.trim() ?? '';
                        if (firstName.isNotEmpty || lastName.isNotEmpty) {
                          return '$firstName $lastName'.trim().toTitleCase();
                        }
                        return (owner.username ?? 'Propertify User')
                            .toTitleCase();
                      }(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // const SizedBox(width: 8),
                  // Text(
                  //   _timeAgo(DateTime.parse(reel.createdAt!)),
                  //   style: const TextStyle(color: Colors.white70, fontSize: 12),
                  // ),
                ],
              ),
              if (reel.location != null && reel.location!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white70,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        reel.location!.toTitleCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 6),
              if (reel.description != null && reel.description!.isNotEmpty)
                _ExpandableDescription(text: reel.description!.capitalize()),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExpandableDescription extends StatefulWidget {
  final String text;
  const _ExpandableDescription({required this.text});

  @override
  State<_ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<_ExpandableDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(
          text: widget.text,
          style: const TextStyle(color: Colors.white),
        );
        final tp = TextPainter(
          text: span,
          maxLines: 2,
          textAlign: TextAlign.start,
          textDirection: ui.TextDirection.ltr,
          textScaler: MediaQuery.of(context).textScaler,
        );
        tp.layout(maxWidth: constraints.maxWidth);

        if (tp.didExceedMaxLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text,
                maxLines: _isExpanded ? null : 2,
                overflow: _isExpanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    _isExpanded ? 'less' : 'more',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Text(widget.text, style: const TextStyle(color: Colors.white));
        }
      },
    );
  }
}
