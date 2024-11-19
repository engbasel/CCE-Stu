// import 'package:flutter/material.dart';

// class CoursesSection extends StatelessWidget {
//   const CoursesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Current Courses - Term 1',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     color: Colors.blueAccent,
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Text(
//                   'Total Credit Hours: 10',
//                   style: const TextStyle(color: Colors.grey, fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16.0),
//           // Horizontal Scroll for Courses
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 // Course 1 - Data Structures
//                 buildCourseCard(
//                   context,
//                   courseName: 'Data Structures',
//                   professorName: 'Dr. Ahmed',
//                   creditHours: 3,
//                   courseColor: Colors.blueAccent,
//                   icon: Icons.storage,
//                 ),
//                 const SizedBox(width: 8.0),
//                 // Course 2 - Algorithms
//                 buildCourseCard(
//                   context,
//                   courseName: 'Algorithms',
//                   professorName: 'Dr. Sara',
//                   creditHours: 4,
//                   courseColor: Colors.orange,
//                   icon: Icons.calculate,
//                 ),
//                 const SizedBox(width: 8.0),
//                 // Course 3 - Discrete Math
//                 buildCourseCard(
//                   context,
//                   courseName: 'Discrete Math',
//                   professorName: 'Dr. Amina',
//                   creditHours: 3,
//                   courseColor: Colors.green,
//                   icon: Icons.functions,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildCourseCard(
//     BuildContext context, {
//     required String courseName,
//     required String professorName,
//     required int creditHours,
//     required Color courseColor,
//     required IconData icon,
//   }) {
//     return Container(
//       width: 160,
//       child: Card(
//         elevation: 3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         color: courseColor.withOpacity(0.9), // Light background for the card
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Course Icon
//               Icon(
//                 icon,
//                 size: 40,
//                 color: Colors.white,
//               ),
//               const SizedBox(height: 8),
//               // Course Info
//               Text(
//                 courseName,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 'Professor: $professorName',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.white70,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 'Credit Hours: $creditHours',
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.white70,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               // View Details Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to the course details page
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                   'View Details',
//                   style: TextStyle(color: courseColor, fontSize: 14),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
