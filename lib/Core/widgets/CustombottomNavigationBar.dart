import 'package:cce_app/Futures/Home/widget/HomeViewboady.dart';
import 'package:cce_app/Futures/Subjects/views/subjectsView.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0; // Default to Home
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomeViewboady(),
          SubjectsView(),
          Placeholder(), // Center action placeholder screen
          NotesScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
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
      ),
    );
  }

  /// Navigation item widget with selectable state
  Widget buildNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
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
        // Navigate to a specific placeholder or trigger an action
        print("Center button pressed");
        _pageController.animateToPage(
          2,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white.withOpacity(0.2),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
    );
  }
}

/// Example placeholder screens
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('School Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notes Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen', style: TextStyle(fontSize: 24)),
    );
  }
}
