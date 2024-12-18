import 'package:cce_app/Core/manager/ColorsManager.dart';
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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          '$level - $semester',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Center the app bar title
        // backgroundColor: Colors.blue[700], // Add a blue app bar color
        backgroundColor: ColorsManager.AppBarColor,
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
    return InkWell(
      onTap: () {
        // Show prerequisite details when the tile is tapped
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(course.name),
            content: Text(
              course.prerequisite.isEmpty
                  ? 'No prerequisite required.'
                  : 'Prerequisite: ${course.prerequisite}',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12.0), // Add padding to the container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // Add rounded corners
          border: Border.all(color: Colors.grey, width: 1.0), // Add a border
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                course.name,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
