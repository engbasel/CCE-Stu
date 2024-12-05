import 'package:flutter/material.dart';

import '../../../Core/helpers/CustomSmallButton.dart';

class StudyResourcesSection extends StatelessWidget {
  const StudyResourcesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Section
        const Text(
          'Quick Study Access:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 12.0),

        // Horizontal Scrollable Section
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Youtube Channel Button with Icon
              CustomSmallButton(
                text: 'YouTube Channel',
                height: 40,
                width: 180,
                buttonColor: Colors.red, // YouTube color
                textColor: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.play_arrow, color: Colors.white),
              ),
              const SizedBox(width: 8.0),

              // View Study Materials Button with Icon
              CustomSmallButton(
                text: 'Study Materials',
                height: 40,
                width: 200,
                buttonColor: Colors.green, // Green for study materials
                textColor: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.book, color: Colors.white),
              ),
              const SizedBox(width: 8.0),

              // Google Drive Button with Icon
              CustomSmallButton(
                text: 'Google Drive',
                height: 40,
                width: 160,
                buttonColor: Colors.blue, // Google Drive color
                textColor: Colors.white,
                onPressed: () {},
                icon: Icon(Icons.folder_copy, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
