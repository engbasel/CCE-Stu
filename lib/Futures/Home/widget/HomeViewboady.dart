import 'package:cce_app/Core/widgets/GPAProgressWidget.dart';
import 'package:cce_app/Futures/Home/widget/AnnouncementsSection.dart';
import 'package:cce_app/Futures/Home/widget/CoursesSection.dart';
import 'package:cce_app/Futures/Home/widget/DeadlinesSection.dart';
import 'package:cce_app/Futures/Home/widget/GreetingSection.dart';
import 'package:cce_app/Futures/Home/widget/NotesSection.dart';
import 'package:cce_app/Futures/Home/widget/NotificationsSection.dart';
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

    // GPA progress calculations
    double GPAprogress = completedGPA / totalGPA;
    int GPApercentage = (GPAprogress * 100).toInt();

    // Credits progress calculations
    double creditsProgress = completedCredits / totalCredits;
    int creditsPercentage = (creditsProgress * 100).toInt();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting Section
          GreetingSection(
            studentName: 'basel Embaby',
          ),
          const SizedBox(height: 16.0),

          // Notifications Section - New Feature
          const NotificationsSection(),
          const SizedBox(height: 16.0),

          // Announcements Section
          const AnnouncementsSection(),
          const SizedBox(height: 16.0),

          // Deadlines Section
          const DeadlinesSection(),
          const SizedBox(height: 16.0),

          // GPA Progress Section
          ProgressSection(
            title: 'Your GPA Progress:',
            progressLabel: 'GPA',
            completedValue: completedGPA,
            totalValue: totalGPA,
            progressValue: GPAprogress,
            progressPercentage: GPApercentage,
            lowProgressColor: Colors.redAccent,
            highProgressColor: Colors.green,
          ),

          // Credits Progress Section
          ProgressSection(
            title: 'Your Credits Progress:',
            progressLabel: 'Credits',
            completedValue: completedCredits,
            totalValue: totalCredits,
            progressValue: creditsProgress,
            progressPercentage: creditsPercentage,
            lowProgressColor: Colors.orange,
            highProgressColor: Colors.blue,
          ),
          const SizedBox(height: 16.0),

          // Courses Section
          const CoursesSection(),
          const SizedBox(height: 16.0),

          // Study Resources Section
          const StudyResourcesSection(),
          const SizedBox(height: 16.0),

          // Notes Section
          const NotesSection(),
        ],
      ),
    );
  }
}
