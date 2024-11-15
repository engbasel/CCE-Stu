import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.menu, // Drawer icon
          color: Colors.white, // Set the drawer icon color to red
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer(); // Opens the drawer
        },
      ),

      title: const Text(
        'Home',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: ColorsManager.AppBarColor, // Customize AppBar color
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            // Add search functionality
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {
            // Add notification functionality
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // The height of the AppBar
}
