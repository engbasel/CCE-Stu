import 'package:cce_app/Core/widgets/GPAProgressWidget.dart';
import 'package:flutter/material.dart';

class HomeViewboady extends StatefulWidget {
  const HomeViewboady({super.key});

  @override
  State<HomeViewboady> createState() => _HomeViewboadyState();
}

class _HomeViewboadyState extends State<HomeViewboady> {
  // Example data
  final double completedGPA = 3.42;
  final double totalGPA = 4.0;
  final double completedCredits = 70;
  final double totalCredits = 160;
  @override
  Widget build(BuildContext context) {
    // Calculate GPA progress
    double GPAprogress = completedGPA / totalGPA;
    int GPApercentage = (GPAprogress * 100).toInt();

    // Calculate credits progress
    double creditsProgress = completedCredits / totalCredits;
    int creditsPercentage = (creditsProgress * 100).toInt();
    return SingleChildScrollView(
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
            leading: const Icon(Icons.assignment),
          ),
          ListTile(
            title: const Text('Final Exam - Nov 22'),
            leading: const Icon(Icons.access_alarm),
          ),
          const SizedBox(height: 16.0),

          // GPA Progress
          ProgressWidget(
            title: 'Your GPA Progress:',
            progressLabel: 'GPA',
            completedValue: completedGPA,
            totalValue: totalGPA,
            progressValue: GPAprogress,
            progressPercentage: GPApercentage,
          ),

          // Credits Progress
          ProgressWidget(
            title: 'Your Credits Progress:',
            progressLabel: 'Credits',
            completedValue: completedCredits,
            totalValue: totalCredits,
            progressValue: creditsProgress,
            progressPercentage: creditsPercentage,
            lowProgressColor: Colors.orange, // Example of custom color
            highProgressColor: Colors.blue, // Example of custom color
          ),

          // Term Courses
          const Text(
            'Current Courses - Term 1:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    title: const Text('Data Structures'),
                    subtitle: const Text('Professor: Dr. Ahmed'),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    title: const Text('Algorithms'),
                    subtitle: const Text('Professor: Dr. Sara'),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    title: const Text('Discrete Math'),
                    subtitle: const Text('Professor: Dr. Amina'),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16.0),

          // Study Resources Section
          const Text(
            'Quick Study Access:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to study resources page
                  },
                  child: const Text('View Study Materials'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to study resources page
                  },
                  child: const Text('Youtube Chanel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to study resources page
                  },
                  child: const Text('Googel drive'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          // Note Taking Section
          const Text(
            'Personal Notes:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to note-taking section
            },
            child: const Text('Take Notes'),
          ),
          const SizedBox(height: 16.0),

          // Notifications Section
        ],
      ),
    );
  }
}
