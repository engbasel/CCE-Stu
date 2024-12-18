// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustombottomNavigationBar extends StatefulWidget {
  const CustombottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustombottomNavigationBar> createState() =>
      _CustombottomNavigationBarState();
}

class _CustombottomNavigationBarState extends State<CustombottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF0A8EA0), // Navigation bar background color
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildNavItem(Icons.home_outlined, 0),
          buildNavItem(Icons.school_outlined, 1),
          buildCenterActionButton(),
          buildNavItem(Icons.note_outlined, 2),
          buildNavItem(Icons.person_outline, 3),
        ],
      ),
    );
  }

  /// Navigation item widget with selectable state
  Widget buildNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Icon(
        icon,
        size: 28,
        color: isSelected
            ? Colors.white
            : Colors.black, // Selected and non-selected colors
      ),
    );
  }

  /// Center action button styled as CircleAvatar
  Widget buildCenterActionButton() {
    return GestureDetector(
      onTap: () {
        // Handle center button action if needed
        print("Center button pressed");
      },
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white.withOpacity(0.2),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
    );
  }
}
