import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingWidget extends StatefulWidget {
  /// Current rating value (1-5)
  final double rating;
  
  /// Maximum rating value (default: 5)
  final int maxRating;
  
  /// Size of each star icon
  final double size;
  
  /// Color of filled stars
  final Color activeColor;
  
  /// Color of unfilled stars
  final Color inactiveColor;
  
  /// Whether the rating is readonly (non-interactive)
  final bool readonly;
  
  /// Callback when rating changes
  final ValueChanged<double>? onRatingChanged;
  
  /// Allow half ratings
  final bool allowHalfRating;
  
  /// Spacing between stars
  final double spacing;

  const RatingWidget({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 24.0,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
    this.readonly = false,
    this.onRatingChanged,
    this.allowHalfRating = false,
    this.spacing = 4.0,
  }) : assert(rating >= 0 && rating <= maxRating, 'Rating must be between 0 and maxRating');

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  void didUpdateWidget(RatingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rating != widget.rating) {
      _currentRating = widget.rating;
    }
  }

  void _handleTap(int index) {
    if (widget.readonly) return;
    
    final newRating = (index + 1).toDouble();
    setState(() {
      _currentRating = newRating;
    });
    
    widget.onRatingChanged?.call(newRating);
  }

  void _handlePanUpdate(DragUpdateDetails details, int index) {
    if (widget.readonly || !widget.allowHalfRating) return;

    final RenderBox box = context.findRenderObject() as RenderBox;
    final localPosition = box.globalToLocal(details.globalPosition);
    final starWidth = widget.size + widget.spacing;
    final relativePosition = localPosition.dx - (index * starWidth);
    
    double newRating;
    if (relativePosition < widget.size / 2) {
      newRating = index + 0.5;
    } else {
      newRating = (index + 1).toDouble();
    }
    
    newRating = newRating.clamp(0.0, widget.maxRating.toDouble());
    
    if (newRating != _currentRating) {
      setState(() {
        _currentRating = newRating;
      });
      widget.onRatingChanged?.call(newRating);
    }
  }

  Widget _buildStar(int index) {
    final starValue = index + 1;
    IconData iconData;
    Color color;

    if (_currentRating >= starValue) {
      // Full star
      iconData = FontAwesomeIcons.solidStar;
      color = widget.activeColor;
    } else if (widget.allowHalfRating && _currentRating >= starValue - 0.5) {
      // Half star
      iconData = FontAwesomeIcons.starHalfStroke;
      color = widget.activeColor;
    } else {
      // Empty star
      iconData = FontAwesomeIcons.star;
      color = widget.inactiveColor;
    }

    Widget star = FaIcon(
      iconData,
      size: widget.size,
      color: color,
    );

    if (widget.readonly) {
      return star;
    }

    return GestureDetector(
      onTap: () => _handleTap(index),
      onPanUpdate: widget.allowHalfRating 
          ? (details) => _handlePanUpdate(details, index)
          : null,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: star,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.maxRating,
        (index) => Padding(
          padding: EdgeInsets.only(
            right: index < widget.maxRating - 1 ? widget.spacing : 0,
          ),
          child: _buildStar(index),
        ),
      ),
    );
  }
}

/// A simplified rating display widget for readonly use cases
class RatingDisplay extends StatelessWidget {
  final double rating;
  final int maxRating;
  final double size;
  final Color activeColor;
  final Color inactiveColor;
  final double spacing;
  final bool showRatingText;
  final TextStyle? ratingTextStyle;

  const RatingDisplay({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 16.0,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
    this.spacing = 2.0,
    this.showRatingText = false,
    this.ratingTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingWidget(
          rating: rating,
          maxRating: maxRating,
          size: size,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          spacing: spacing,
          readonly: true,
          allowHalfRating: true,
        ),
        if (showRatingText) ...[
          SizedBox(width: spacing * 2),
          Text(
            rating.toStringAsFixed(1),
            style: ratingTextStyle ?? 
                Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
        ],
      ],
    );
  }
}