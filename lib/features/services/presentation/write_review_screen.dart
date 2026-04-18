import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/features/services/models/services_response_model.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:propertify/utils/custom_toast.dart';

class WriteReviewScreen extends StatefulWidget {
  static const String routeName = '/write-review';

  final String serviceId;
  final String? reviewId;
  final double? initialRating;
  final String? initialReview;

  const WriteReviewScreen({
    super.key,
    required this.serviceId,
    this.reviewId,
    this.initialRating,
    this.initialReview,
  });

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final TextEditingController _reviewController = TextEditingController();
  final int _maxChars = 350;
  double _rating = 0.0;

  @override
  void initState() {
    super.initState();
    // Load service details for header context
    context.read<ServicesBloc>().add(
      ServicesEvent.getServiceDetailsEvent(serviceId: widget.serviceId),
    );

    // Initialize values if editing
    if (widget.initialReview != null) {
      _reviewController.text = widget.initialReview!;
    }
    if (widget.initialRating != null) {
      _rating = widget.initialRating!;
    }

    _reviewController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        final ServicesResponseModel? service = state.serviceDetails;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => context.pop(),
            ),
            centerTitle: true,
            title: const Text(
              'Write a review',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: BlocListener<ServicesBloc, ServicesState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state.notifyStatus?.message == 'Review posted successfully' ||
                  state.notifyStatus?.message == 'Review edited successfully') {
                CustomToast.showSuccessToast(
                  msg: state.notifyStatus!.message,
                ).then((value) => context.pop());
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service header
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(
                              (service?.imageUrls != null &&
                                      service!.imageUrls!.isNotEmpty)
                                  ? service.imageUrls!.first
                                  : 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=300&h=200&fit=crop',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service?.agentName ?? 'Service',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              service?.description ?? 'Relastate',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Rating',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedRatingStars(
                    initialRating: _rating,
                    minRating: 0.0,
                    maxRating: 5.0,
                    filledColor: Colors.orange,
                    emptyColor: Colors.grey[300]!,
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    customEmptyIcon: Icons.star_border,
                    starSize: 32.0,
                    displayRatingValue: false,
                    interactiveTooltips: true,
                    onChanged: (double r) {
                      setState(() {
                        _rating = r;
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Write your review',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),

                  CommonTextFormField(
                    controller: _reviewController,
                    hintText: 'Write your review here...',
                    maxLength: _maxChars,
                    maxlines: 5,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_maxChars - _reviewController.text.length} characters remaining',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    child: CommonCustomButton(
                      onTap: () {
                        if (_rating == 0) {
                          CustomToast.showWarningToast(
                            msg: 'Please provide rating',
                          );
                          return;
                        }
                        if (_reviewController.text.isEmpty) {
                          CustomToast.showWarningToast(
                            msg: 'Please write review',
                          );
                          return;
                        }
                        if (widget.reviewId != null) {
                          context.read<ServicesBloc>().add(
                            ServicesEvent.editReviewEvent(
                              serviceId: widget.serviceId,
                              reviewId: widget.reviewId!,
                              rating: _rating,
                              review: _reviewController.text,
                            ),
                          );
                        } else {
                          context.read<ServicesBloc>().add(
                            ServicesEvent.postReviewEvent(
                              rating: _rating,
                              review: _reviewController.text,
                              serviceId: service!.id!,
                            ),
                          );
                        }
                      },
                      buttonLabel: widget.reviewId != null
                          ? 'Update Review'
                          : 'Submit Review',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
