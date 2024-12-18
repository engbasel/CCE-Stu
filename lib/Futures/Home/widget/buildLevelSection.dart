// import 'package:cce_app/Futures/Home/Models/Course.dart';

import 'package:cce_app/Futures/Home/Models/Course.dart';
import 'package:cce_app/Futures/Home/widget/LevelScreenView.dart';
import 'package:flutter/material.dart';

Widget buildLevelSection(BuildContext context, String levelTitle,
    {Color? collapsedColor, Color? expandedColor}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    decoration: BoxDecoration(
      color: collapsedColor ?? Colors.grey.shade200,
      borderRadius: BorderRadius.circular(20), // Circular border radius
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: const Offset(2, 2), // Adds a subtle shadow
        ),
      ],
    ),
    child: Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent, // Removes the ExpansionTile divider
      ),
      child: ExpansionTile(
        backgroundColor: expandedColor ?? Colors.grey.shade400,
        collapsedBackgroundColor: Colors.transparent, // Use the container color
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20), // Adds radius to expanded state
        ),
        title: Text(
          levelTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: const Text('Semester 1'),
            onTap: () {
              final courses =
                  AcadimicCousresData[levelTitle]?['Semester 1'] ?? [];
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
              final courses =
                  AcadimicCousresData[levelTitle]?['Semester 2'] ?? [];
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
      ),
    ),
  );
}
