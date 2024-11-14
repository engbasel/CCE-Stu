import 'package:flutter/material.dart';

class ProgressSection extends StatelessWidget {
  // Parameters to customize the widget
  final String title;
  final String
      progressLabel; // Label to describe progress (e.g., "GPA", "Credits")
  final double completedValue; // Completed value for progress (e.g., 3.5 GPA)
  final double totalValue; // Total possible value for progress (e.g., 4.0 GPA)
  final double progressValue; // Value between 0 and 1 representing progress
  final int progressPercentage; // Percentage (0-100) of the progress
  final Color lowProgressColor; // Color for low progress
  final Color highProgressColor; // Color for high progress

  const ProgressSection({
    Key? key,
    required this.title,
    required this.progressLabel,
    required this.completedValue,
    required this.totalValue,
    required this.progressValue,
    required this.progressPercentage,
    this.lowProgressColor = Colors.red,
    this.highProgressColor = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dynamic color based on progress
    Color progressColor =
        progressValue < 0.5 ? lowProgressColor : highProgressColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, // Customizable title for the progress section
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8.0),

        // Linear Progress Bar with dynamic progress label
        LinearProgressIndicator(
          minHeight: 6.0,
          semanticsLabel: '$progressLabel Progress',
          semanticsValue:
              '$completedValue/$totalValue $progressLabel completed',
          value: progressValue, // Dynamic progress value
          backgroundColor: Colors.grey[300],
          color: progressColor, // Dynamic color based on progress
        ),
        const SizedBox(height: 8.0),

        // Display completed and total value and progress percentage
        Row(
          children: [
            Text(
              '$progressLabel: $completedValue/$totalValue',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Text(
              'Progress: $progressPercentage%', // Display progress as percentage
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
