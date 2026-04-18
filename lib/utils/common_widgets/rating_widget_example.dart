import 'package:flutter/material.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'rating_widget.dart';

/// Example usage of RatingWidget
class RatingWidgetExample extends StatefulWidget {
  const RatingWidgetExample({super.key});

  @override
  State<RatingWidgetExample> createState() => _RatingWidgetExampleState();
}

class _RatingWidgetExampleState extends State<RatingWidgetExample> {
  double _interactiveRating = 3.0;
  double _halfRating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating Widget Examples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Interactive Rating
            const Text(
              'Interactive Rating:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RatingWidget(
              rating: _interactiveRating,
              size: 32,
              onRatingChanged: (rating) {
                setState(() {
                  _interactiveRating = rating;
                });
                CustomToast.showInfoToast(
                  msg: 'Rating changed to: $rating',
                );
              },
            ),
            Text('Current rating: $_interactiveRating'),
            
            const SizedBox(height: 32),
            
            // Interactive with Half Rating
            const Text(
              'Interactive with Half Rating:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RatingWidget(
              rating: _halfRating,
              size: 32,
              allowHalfRating: true,
              onRatingChanged: (rating) {
                setState(() {
                  _halfRating = rating;
                });
              },
            ),
            Text('Current rating: $_halfRating'),
            
            const SizedBox(height: 32),
            
            // Readonly Rating
            const Text(
              'Readonly Rating:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const RatingWidget(
              rating: 4.0,
              readonly: true,
              size: 28,
            ),
            
            const SizedBox(height: 32),
            
            // Custom Colors
            const Text(
              'Custom Colors:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const RatingWidget(
              rating: 3.0,
              readonly: true,
              size: 28,
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
            ),
            
            const SizedBox(height: 32),
            
            // Rating Display with Text
            const Text(
              'Rating Display with Text:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const RatingDisplay(
              rating: 4.2,
              showRatingText: true,
              size: 20,
            ),
            
            const SizedBox(height: 32),
            
            // Small Rating Display
            const Text(
              'Small Rating Display:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const RatingDisplay(
              rating: 3.5,
              size: 14,
              showRatingText: true,
            ),
          ],
        ),
      ),
    );
  }
}