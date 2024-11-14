import 'package:cce_app/Core/widgets/CustomAppBar.dart';
import 'package:cce_app/Futures/Home/widget/CustomDrawer.dart';
import 'package:cce_app/Futures/Home/widget/HomeViewboady.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // This now works fine
      drawer: Custom_Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: HomeViewboady(),
      ),
    );
  }
}
