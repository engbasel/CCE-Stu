import 'package:cce_app/Futures/Home/Models/Course.dart';
import 'package:flutter/material.dart';

class CoursesSection extends StatelessWidget {
  final List<Course> courses;

  const CoursesSection({Key? key, required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Text(
                  'Current Courses - Term 1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Total Credit Hours: ${_calculateTotalCreditHours()}',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          // Horizontal Scroll for Courses

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: courses
                  .map((course) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: buildCourseCard(
                          context,
                          course: course,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  int _calculateTotalCreditHours() {
    return courses.fold(0, (sum, course) => sum + course.creditHours);
  }

  Widget buildCourseCard(
    BuildContext context, {
    required Course course,
  }) {
    return Container(
      width: 160,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color:
            Colors.blueAccent.withOpacity(0.9), // Light background for the card
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Course Icon
              Icon(
                Icons.book, // Default icon, customize as needed
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              // Course Info
              Text(
                course.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Professor: ${course.professor}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Credit Hours: ${course.creditHours}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 8),
              // View Details Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the course details page
                  // You can pass the course object to the details screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'View Details',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
