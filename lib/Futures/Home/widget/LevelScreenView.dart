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
    required this.courses, // Add the courses parameter here
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$level - $semester'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ListTile(
            title: Text(course.name),
            subtitle: Text('${course.code} | Credits: ${course.creditHours}'),
            trailing: Text(course.professor),
          );
        },
      ),
    );
  }
}
