import 'package:cce_app/Futures/Home/widget/CustomDrawer.dart';
import 'package:cce_app/Futures/Home/widget/HomeViewboady.dart';
import 'package:cce_app/Futures/Notes/views/AddnotsView.dart';
import 'package:cce_app/Futures/Notes/views/NotesView.dart';
import 'package:cce_app/Futures/Subjects/views/subjectsView.dart';
import 'package:cce_app/Futures/profile/views/profileview.dart';
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
      drawer: CustomDrawer(),
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
          NotesView(),
          Profileview(),
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
              // ignore: deprecated_member_use
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
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }

  /// Center action button styled as CircleAvatar
  Widget buildCenterActionButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddNoteScreen()));
        _pageController.animateToPage(
          2,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xff3a6d8c),
          child: Image.asset('assets/General/plus.png')),
    );
  }
}
