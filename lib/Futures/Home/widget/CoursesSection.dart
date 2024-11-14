import 'package:flutter/material.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Current Courses - Term 1:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  title: Text('Data Structures'),
                  subtitle: Text('Professor: Dr. Ahmed'),
                ),
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  title: Text('Algorithms'),
                  subtitle: Text('Professor: Dr. Sara'),
                ),
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  title: Text('Discrete Math'),
                  subtitle: Text('Professor: Dr. Amina'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
