import 'package:flutter/material.dart';

class StepProgressBar extends StatelessWidget {
  final int currentStep;
  final Function(int)? onStepTapped;

  static const List<String> steps = [
    'Property',
    'Location',
    'Details',
    'Photos',
    'Publish',
  ];

  const StepProgressBar({
    super.key,
    required this.currentStep,
    this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(steps.length, (index) {
          final isCompleted = index < currentStep;
          final isCurrent = index == currentStep;

          Color dotColor = Colors.grey.shade300;
          if (isCompleted || isCurrent) {
            dotColor = primaryColor;
          }

          return Expanded(
            child: InkWell(
              onTap: onStepTapped != null ? () => onStepTapped!(index) : null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      // Connecting line (left)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: index == 0
                              ? Colors.transparent
                              : (index <= currentStep
                                  ? primaryColor
                                  : Colors.grey.shade300),
                        ),
                      ),
                      // Dot
                      Container(
                        width: isCurrent ? 14 : 10,
                        height: isCurrent ? 14 : 10,
                        decoration: BoxDecoration(
                          color: dotColor,
                          shape: BoxShape.circle,
                          boxShadow: isCurrent
                              ? [
                                  BoxShadow(
                                    color: primaryColor.withValues(alpha: 0.3),
                                    blurRadius: 6,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : null,
                        ),
                        child: isCompleted
                            ? const Icon(
                                Icons.check,
                                size: 8,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      // Connecting line (right)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: index == steps.length - 1
                              ? Colors.transparent
                              : (index < currentStep
                                  ? primaryColor
                                  : Colors.grey.shade300),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    steps[index],
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                      color: isCurrent
                          ? primaryColor
                          : (isCompleted
                              ? Colors.black87
                              : Colors.grey.shade500),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
