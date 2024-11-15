import 'package:flutter/material.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current Courses - Term 1:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 16.0),
          // Horizontal Scroll for Courses
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Course 1 - Data Structures
                _buildCourseCard(
                  context,
                  courseName: 'Data Structures',
                  professorName: 'Dr. Ahmed',
                  creditHours: 3,
                  courseColor: Colors.blueAccent,
                ),
                const SizedBox(width: 8.0),
                // Course 2 - Algorithms
                _buildCourseCard(
                  context,
                  courseName: 'Algorithms',
                  professorName: 'Dr. Sara',
                  creditHours: 4,
                  courseColor: Colors.orange,
                ),
                const SizedBox(width: 8.0),
                // Course 3 - Discrete Math
                _buildCourseCard(
                  context,
                  courseName: 'Discrete Math',
                  professorName: 'Dr. Amina',
                  creditHours: 3,
                  courseColor: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(
    BuildContext context, {
    required String courseName,
    required String professorName,
    required int creditHours,
    required Color courseColor,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: courseColor, // Light background for the card
      // color: courseColor.withOpacity(0.1), // Light background for the card
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Course Info
            Text(
              courseName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: courseColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Professor: $professorName',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Credit Hours: $creditHours',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            // View Details Button
            TextButton(
              onPressed: () {
                // Navigate to the course details page
              },
              style: TextButton.styleFrom(
                foregroundColor: courseColor,
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: const Text(
                'View Details',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
