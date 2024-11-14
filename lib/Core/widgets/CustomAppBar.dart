import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Home'),
      backgroundColor: Colors.blueAccent, // Customize AppBar color
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Add search functionality
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
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
