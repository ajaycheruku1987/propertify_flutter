import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/models/seller_review_model.dart';
import 'package:propertify/features/profile/repo/profile_repo.dart';
import 'package:propertify/utils/custom_toast.dart';

class WriteReviewBottomSheet {
  static void show(
    BuildContext context, {
    required String sellerId,
    SellerReviewItem? existingReview,
    VoidCallback? onReviewSubmitted,
  }) {
    if (!context.read<HomeBloc>().state.showAddButton) {
      CustomToast.showErrorToast(msg: 'Please login to write a review');
      context.push(AuthScreen.routeName);
      return;
    }

    double selectedRating = existingReview?.rating ?? 5.0;
    final TextEditingController reviewController = TextEditingController(
      text: existingReview?.review ?? '',
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setBottomSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        existingReview != null ? 'Edit Your Review' : 'Rate & Review Seller',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Text(
                    'Your Rating',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Column(
                      children: [
                        StarRatingWidget(
                          rating: selectedRating,
                          size: 32.0,
                          readOnly: false,
                          onChanged: (rating) {
                            setBottomSheetState(() {
                              selectedRating = rating;
                            });
                          },
                        ),
                        const SizedBox(height: 6),
                        Text(
                          selectedRating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your Experience',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: reviewController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Share your experience dealing with this seller...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final comment = reviewController.text.trim();
                        final res = await ProfileRepo().postSellerReview(
                          sellerId: sellerId,
                          rating: selectedRating,
                          review: comment,
                        );

                        if (context.mounted) {
                          res.fold(
                            (failure) => CustomToast.showErrorToast(msg: failure.message),
                            (success) {
                              Navigator.pop(context);
                              CustomToast.showSuccessToast(
                                msg: existingReview != null
                                    ? 'Review updated successfully!'
                                    : 'Review submitted successfully!',
                              );
                              if (onReviewSubmitted != null) {
                                onReviewSubmitted();
                              }
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Submit Review',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class StarRatingWidget extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;
  final ValueChanged<double>? onChanged;
  final bool readOnly;

  const StarRatingWidget({
    super.key,
    required this.rating,
    this.size = 16.0,
    this.color = Colors.amber,
    this.onChanged,
    this.readOnly = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        IconData icon;
        if (index + 1 <= rating) {
          icon = Icons.star;
        } else if (index + 0.5 <= rating) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }

        return GestureDetector(
          onTap: readOnly || onChanged == null ? null : () => onChanged!((index + 1).toDouble()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Icon(icon, color: color, size: size),
          ),
        );
      }),
    );
  }
}
