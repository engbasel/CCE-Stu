import 'package:cce_app/Futures/Home/widget/OpenCourseRequest.dart';
import 'package:cce_app/Futures/Home/widget/StudyMaterialview.dart';
import 'package:cce_app/Futures/Home/widget/buildLevelSection.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.white,
      elevation: 0,
      shadowColor: Colors.amber,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer Header
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Student Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // General Navigation Items
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Study Materials'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const StudyMaterial();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Your Timetable'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notes),
            title: const Text('Personal Notes'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Grades History'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),

          // Academic Levels Navigation
          ExpansionTile(
            leading: const Icon(Icons.school),
            title: const Text('Academic Subjects'),
            children: <Widget>[
              buildLevelSection(context, 'Level 000'),
              buildLevelSection(context, 'Level 100'),
              buildLevelSection(context, 'Level 200'),
              buildLevelSection(context, 'Level 300'),
              buildLevelSection(context, 'Level 400'),
            ],
          ),

          const Divider(),
          ExpansionTile(
            title: const Text('Academic applications'),
            children: <Widget>[
              ListTile(
                title: const Text('Apply for open unregular course'),
                leading: const Icon(Icons.attach_money),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OpenCourseRequest(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Apply for Scholarship'),
                leading: const Icon(Icons.attach_money),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
