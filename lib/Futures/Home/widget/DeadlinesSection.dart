import 'package:flutter/material.dart';

class DeadlinesSection extends StatelessWidget {
  const DeadlinesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Upcoming Deadlines & Events:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        ListTile(
          title: Text('Assignment 1 Due - Nov 18'),
          leading: Icon(Icons.assignment),
        ),
        ListTile(
          title: Text('Final Exam - Nov 22'),
          leading: Icon(Icons.access_alarm),
        ),
      ],
    );
  }
}
