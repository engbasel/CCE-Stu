import 'package:flutter/material.dart';

class Custom_Drawer extends StatelessWidget {
  const Custom_Drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          // Drawer Items for Navigation
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
              // Navigate to study materials page
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Your Timetable'),
            onTap: () {
              // Navigate to timetable section
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notes),
            title: const Text('Personal Notes'),
            onTap: () {
              // Navigate to notes section
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Grades History'),
            onTap: () {
              // Navigate to grades history page
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to settings page
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
