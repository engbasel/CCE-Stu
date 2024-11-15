import 'package:cce_app/Futures/Home/Models/Course.dart';
import 'package:flutter/material.dart';

class LevelScreen extends StatelessWidget {
  final String level;
  final String semester;
  final List<Course> courses;

  const LevelScreen({
    super.key,
    required this.level,
    required this.semester,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$level - $semester'),
        centerTitle: true, // Center the app bar title
        backgroundColor: Colors.blue[700], // Add a blue app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add some padding
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CourseListTile(course: course),
            ); // Use a custom widget
          },
        ),
      ),
    );
  }
}

class CourseListTile extends StatelessWidget {
  final Course course;

  const CourseListTile({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0), // Add padding to the container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Add rounded corners
        border: Border.all(color: Colors.grey, width: 1.0), // Add a border
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              course.name,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10.0), // Add spacing between elements
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${course.code} | Credits: ${course.creditHours}',
                style: const TextStyle(fontSize: 12.0),
              ),
              Text(
                course.professor,
                style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
