import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
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
            icon: Icons.school,
            text: 'Subjects',
            onTap: () => Navigator.pop(context),
          ),
          buildDrawerItem(
            icon: Icons.event,
            text: 'Events',
            onTap: () => Navigator.pop(context),
          ),
          buildDrawerItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () => Navigator.pop(context),
          ),
          buildDrawerItem(
            icon: Icons.info,
            text: 'About',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  ListTile buildDrawerItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
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
