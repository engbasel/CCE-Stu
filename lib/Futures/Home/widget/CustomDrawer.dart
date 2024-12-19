import 'package:cce_app/Futures/Home/widget/OpenCourseRequest.dart';
import 'package:cce_app/Futures/Home/widget/StudyMaterialview.dart';
import 'package:cce_app/Futures/Home/widget/buildLevelSection.dart';
import 'package:cce_app/Futures/Settings/view/SettingsView.dart';
import 'package:cce_app/Core/manager/ColorsManager.dart';
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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: ColorsManager.AppBarColor,
            ),
            child: Text(
              'Welcome to CCE App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () => Navigator.pop(context),
          ),
          buildDrawerItem(
            icon: Icons.book,
            text: 'Study Materials',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StudyMaterial(),
              ),
            ),
          ),
          buildDrawerItem(
            icon: Icons.schedule,
            text: 'Your Timetable',
            onTap: () => Navigator.pop(context),
          ),
          buildDrawerItem(
            icon: Icons.notes,
            text: 'Personal Notes',
            onTap: () => Navigator.pop(context),
          ),
          buildDrawerItem(
            icon: Icons.history,
            text: 'Grades History',
            onTap: () => Navigator.pop(context),
          ),
          buildDrawerItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsView(),
              ),
            ),
          ),
          const Divider(),
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
            title: const Text('Academic Applications'),
            children: <Widget>[
              buildDrawerItem(
                icon: Icons.attach_money,
                text: 'Apply for Open Unregular Course',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenCourseRequest(),
                  ),
                ),
              ),
              buildDrawerItem(
                icon: Icons.attach_money,
                text: 'Apply for Scholarship',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  ListTile buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: ColorsManager.billIconColor),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
