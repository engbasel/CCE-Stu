import 'package:cce_app/Futures/Home/Models/Course.dart';
import 'package:cce_app/Futures/Home/widget/AnnouncementsSection.dart';
import 'package:cce_app/Futures/Home/widget/CommonNewsSection.dart';
import 'package:cce_app/Futures/Home/widget/CoursesSection.dart';
import 'package:cce_app/Futures/Home/widget/DeadlinesSection.dart';
import 'package:cce_app/Futures/Home/widget/GreetingSection.dart';
import 'package:cce_app/Futures/Home/widget/NotesSection.dart';
import 'package:cce_app/Futures/Home/widget/NotificationsSection.dart';
import 'package:cce_app/Futures/Home/widget/PopularProfessorsSection.dart';
import 'package:cce_app/Futures/Home/widget/StudyResourcesSection.dart';
import 'package:flutter/material.dart';

class HomeViewboady extends StatelessWidget {
  const HomeViewboady({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      Course(
        code: 'CS101',
        name: 'Data Structures',
        creditHours: 3,
        professor: 'Dr. Ahmed',
        prerequisite: 'Introduction to Programming',
      ),
      Course(
        code: 'CS102',
        name: 'Algorithms',
        creditHours: 4,
        professor: 'Dr. Sara',
        prerequisite: 'Data Structures',
      ),
      Course(
        code: 'MATH201',
        name: 'Discrete Math',
        creditHours: 3,
        professor: 'Dr. Amina',
        prerequisite: 'Calculus I',
      ),
      Course(
        code: 'MATH201',
        name: 'Discrete Math',
        creditHours: 3,
        professor: 'Dr. Amina',
        prerequisite: 'Calculus I',
      ),
    ];
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

          //----------------------------- Announcements Section -----------------------------
          const AnnouncementsSection(),
          //----------------------------- Announcements Section -----------------------------

          const SizedBox(height: 16.0),

          //----------------------------- Deadlines Section -----------------------------
          const DeadlinesSection(),
          //----------------------------- Deadlines Section -----------------------------

          const SizedBox(height: 16.0),
          // ---------------------------------- Common News Section -----------------------------
          CommonNewsSection(),
          // ---------------------------------- Common News Section -----------------------------
          // ---------------------------------- Popular Professors Section ----------------------
          PopularProfessorsSection(),
          // ---------------------------------- Popular Professors Section ----------------------
          // ---------------------------------- Courses Section ---------------------------------
          CoursesSection(courses: courses),
          // ---------------------------------- Courses Section ---------------------------------

          const SizedBox(height: 16.0),

          //  ---------------------------------- Study Resources Section ------------------------
          const StudyResourcesSection(),
          //  ---------------------------------- Study Resources Section ------------------------

          const SizedBox(height: 16.0),

          //---------------------------------- Notes Section ----------------------------------
          const NotesSection(),
          //---------------------------------- Notes Section ----------------------------------
        ],
      ),
    );
  }
}
