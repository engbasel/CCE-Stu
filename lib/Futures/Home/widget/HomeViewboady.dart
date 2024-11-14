// lib/Futures/Home/HomeViewboady.dart
import 'package:cce_app/Core/widgets/GPAProgressWidget.dart';
import 'package:cce_app/Futures/Home/widget/AnnouncementsSection.dart';
import 'package:cce_app/Futures/Home/widget/CoursesSection.dart';
import 'package:cce_app/Futures/Home/widget/DeadlinesSection.dart';
import 'package:cce_app/Futures/Home/widget/GreetingSection.dart';
import 'package:cce_app/Futures/Home/widget/NotesSection.dart';
import 'package:cce_app/Futures/Home/widget/StudyResourcesSection.dart';
import 'package:flutter/material.dart';

class HomeViewboady extends StatelessWidget {
  const HomeViewboady({super.key});

  @override
  Widget build(BuildContext context) {
    final double completedGPA = 3.42;
    final double totalGPA = 4.0;
    final double completedCredits = 70;
    final double totalCredits = 160;
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
          // lib/Futures/Home/sections/greeting_section.dart
          const GreetingSection(),
          const SizedBox(height: 16.0),

          // lib/Futures/Home/sections/announcements_section.dart
          const AnnouncementsSection(),

          const SizedBox(height: 16.0),

          // lib/Futures/Home/sections/deadlines_section.dart
          const DeadlinesSection(),

          const SizedBox(height: 16.0),

          // GPA Progress
          ProgressSection(
            title: 'Your GPA Progress:',
            progressLabel: 'GPA',
            completedValue: completedGPA,
            totalValue: totalGPA,
            progressValue: GPAprogress,
            progressPercentage: GPApercentage,
          ),

          // Credits Progress
          ProgressSection(
            title: 'Your Credits Progress:',
            progressLabel: 'Credits',
            completedValue: completedCredits,
            totalValue: totalCredits,
            progressValue: creditsProgress,
            progressPercentage: creditsPercentage,
            lowProgressColor: Colors.orange, // Example of custom color
            highProgressColor: Colors.blue, // Example of custom color
          ),
          const SizedBox(height: 16.0),

          // lib/Futures/Home/sections/courses_section.dart
          const CoursesSection(),
          const SizedBox(height: 16.0),

          // lib/Futures/Home/sections/study_resources_section.dart
          const StudyResourcesSection(),
          const SizedBox(height: 16.0),

          // lib/Futures/Home/sections/notes_section.dart
          const NotesSection(),
        ],
      ),
    );
  }
}
