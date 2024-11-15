import 'package:cce_app/Futures/Home/Models/Course.dart';
import 'package:cce_app/Futures/Home/widget/LevelScreenView.dart';
import 'package:flutter/material.dart';

Widget buildLevelSection(BuildContext context, String levelTitle) {
  return ExpansionTile(
    title: Text(
      levelTitle,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    children: <Widget>[
      ListTile(
        title: const Text('Semester 1'),
        onTap: () {
          final courses = AcadimicCousresData[levelTitle]?['Semester 1'] ?? [];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LevelScreen(
                level: levelTitle,
                semester: 'Semester 1',
                courses: courses,
              ),
            ),
          );
        },
      ),
      ListTile(
        title: const Text('Semester 2'),
        onTap: () {
          final courses = AcadimicCousresData[levelTitle]?['Semester 2'] ?? [];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LevelScreen(
                level: levelTitle,
                semester: 'Semester 2',
                courses: courses,
              ),
            ),
          );
        },
      ),
    ],
  );
}
