// import 'package:cce_app/Futures/Home/widget/CustomDrawer.dart';
import 'package:cce_app/Futures/Home/widget/HomeViewboady.dart';
import 'package:flutter/material.dart';

// import '../widget/CustomAppBar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // bottomNavigationBar: const BottomAppBar(
      //   color: ColorsManager.buttomnavigationbar,
      // ),
      // floatingActionButton: CustomNavigationBar(),
      bottomNavigationBar: CustombottomNavigationBar(),
      // backgroundColor: ColorsManager.backgroundScaffoldColor,
      // appBar: CustomAppBar(), // This now works fine
      // drawer: CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: HomeViewboady(),
        ),
      ),
    );
  }
}

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
          _buildNavItem(Icons.home_outlined, 0),
          _buildNavItem(Icons.school_outlined, 1),
          _buildCenterActionButton(),
          _buildNavItem(Icons.note_outlined, 2),
          _buildNavItem(Icons.person_outline, 3),
        ],
      ),
    );
  }

  /// Navigation item widget with selectable state
  Widget _buildNavItem(IconData icon, int index) {
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
  Widget _buildCenterActionButton() {
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
