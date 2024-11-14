/**
 * Recommended Items for the Home Screen
Personalized Greeting: A greeting based on the time of day.
Announcements: Display department updates or important notices.
Upcoming Deadlines/Events: Show upcoming exams, assignments, or workshops.
Quick Links: Buttons for frequently accessed features like GPA, Courses, etc.
Current Courses: List of the user’s active subjects or courses.
Progress Bar: Show academic progress (credits completed vs. total required).
Study Resources: Quick access to lecture notes, textbooks, etc.
 */

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Personalized Greeting
              Text(
                'Good Morning, [Student Name]!', // Replace with dynamic name
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),

              // Announcements Section
              const Text(
                'Important Announcements:',
                style: TextStyle(fontWeight: FontWeight.bold),
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
              const SizedBox(height: 16.0),

              // Upcoming Deadlines
              const Text(
                'Upcoming Deadlines & Events:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              ListTile(
                title: const Text('Assignment 1 Due - Nov 18'),
                leading: Icon(Icons.assignment),
              ),
              ListTile(
                title: const Text('Final Exam - Nov 22'),
                leading: Icon(Icons.access_alarm),
              ),
              const SizedBox(height: 16.0),

              // Quick Links Section
              const Text(
                'Quick Links:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, GPAView.routeName);
                    },
                    child: const Text('GPA Tracker'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, CoursesView.routeName);
                    },
                    child: const Text('My Courses'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Academic Progress Section
              const Text(
                'Your Academic Progress:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              LinearProgressIndicator(
                value: 0.65, // Replace with dynamic progress
                backgroundColor: Colors.grey[300],
                color: Colors.green,
              ),
              const SizedBox(height: 16.0),

              // Current Courses Section
              const Text(
                'Current Courses:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Data Structures'),
                subtitle: const Text('Professor: Dr. Ahmed'),
              ),
              ListTile(
                title: const Text('Algorithms'),
                subtitle: const Text('Professor: Dr. Sara'),
              ),
              const SizedBox(height: 16.0),

              // Study Resources Section
              const Text(
                'Study Resources:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to study resources section
                },
                child: const Text('View Study Materials'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
