import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/features/services/models/service_reviews_response_model.dart';
import 'package:propertify/utils/common_widgets/rating_widget.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';

class ServiceReviewsScreen extends StatefulWidget {
  static const String routeName = '/service-reviews';

  final String serviceId;

  const ServiceReviewsScreen({super.key, required this.serviceId});

  @override
  State<ServiceReviewsScreen> createState() => _ServiceReviewsScreenState();
}

class _ServiceReviewsScreenState extends State<ServiceReviewsScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;
  final int _pageSize = 20;
  bool _isLoadingMore = false;
  List<ServiceReviewsResponseModel> _allReviews = [];

  @override
  void initState() {
    super.initState();
    _loadInitialReviews();
    _scrollController.addListener(_onScroll);
  }

  void _loadInitialReviews() {
    context.read<ServicesBloc>().add(
      ServicesEvent.getServiceReviewsEvent(
        serviceId: widget.serviceId,
        skip: 0,
        limit: _pageSize,
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreReviews();
    }
  }

  void _loadMoreReviews() {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    final nextPage = _currentPage + 1;
    context.read<ServicesBloc>().add(
      ServicesEvent.getServiceReviewsEvent(
        serviceId: widget.serviceId,
        skip: nextPage * _pageSize,
        limit: _pageSize,
      ),
    );
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ServicesBloc, ServicesState>(
        listener: (context, state) {
          if (!state.isReviewsLoading && _isLoadingMore) {
            setState(() {
              // Append new reviews to existing list
              final newReviews = state.serviceReviews
                  .where((review) => !_allReviews.any((r) => r.id == review.id))
                  .toList();

              if (newReviews.isNotEmpty) {
                _allReviews.addAll(newReviews);
                _currentPage++;
              }
              _isLoadingMore = false;
            });
          } else if (!state.isReviewsLoading && _allReviews.isEmpty) {
            // Initial load
            setState(() {
              _allReviews = state.serviceReviews;
              if (_allReviews.isNotEmpty) {
                _currentPage = 0;
              }
            });
          }
        },
        builder: (context, state) {
          if (state.isReviewsLoading && _allReviews.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_allReviews.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.rate_review_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No reviews yet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Be the first to review this service',
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(20),
            itemCount: _allReviews.length + (_isLoadingMore ? 1 : 0),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (index == _allReviews.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final review = _allReviews[index];
              return _buildReviewCard(review);
            },
          );
        },
      ),
    );
  }

  Widget _buildReviewCard(ServiceReviewsResponseModel review) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Profile Image
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: ClipOval(
                  child: review.user?.profilepic?.isNotEmpty ?? false
                      ? CachedNetworkImage(
                          imageUrl: review.user!.profilepic!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          errorWidget: (context, url, error) =>
                              const LogoPlaceholder(
                                logoWidth: 24,
                                logoHeight: 24,
                              ),
                        )
                      : const LogoPlaceholder(logoWidth: 24, logoHeight: 24),
                ),
              ),
              const SizedBox(width: 12),
              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.user?.username ?? 'Anonymous',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    RatingDisplay(
                      rating: (review.rating ?? 0).toDouble(),
                      size: 18,
                      activeColor: Colors.orange,
                    ),
                  ],
                ),
              ),
              // Date
              if (review.createdAt != null)
                Text(
                  _formatDate(review.createdAt!),
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
            ],
          ),
          if (review.review?.isNotEmpty ?? false) ...[
            const SizedBox(height: 12),
            Text(
              review.review!,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF666666),
                height: 1.5,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays == 0) {
        if (difference.inHours == 0) {
          if (difference.inMinutes == 0) {
            return 'Just now';
          }
          return '${difference.inMinutes}m ago';
        }
        return '${difference.inHours}h ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}d ago';
      } else if (difference.inDays < 30) {
        final weeks = (difference.inDays / 7).floor();
        return '${weeks}w ago';
      } else if (difference.inDays < 365) {
        final months = (difference.inDays / 30).floor();
        return '${months}mo ago';
      } else {
        final years = (difference.inDays / 365).floor();
        return '${years}y ago';
      }
    } catch (e) {
      return '';
    }
  }
}
