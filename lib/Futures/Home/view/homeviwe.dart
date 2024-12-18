// import 'package:cce_app/Futures/Home/widget/CustomDrawer.dart';
import 'package:cce_app/Futures/Home/widget/CustombottomNavigationBar.dart';
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
