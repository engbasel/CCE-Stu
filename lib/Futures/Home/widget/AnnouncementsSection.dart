import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:flutter/material.dart';

class AnnouncementsSection extends StatelessWidget {
  const AnnouncementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Important Announcements:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorsManager.coustomLabelTextColor,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.blueAccent,
          child: const Text(
            'Reminder: Exam Week Starts Next Monday!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
