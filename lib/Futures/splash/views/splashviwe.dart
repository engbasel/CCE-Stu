import 'package:cce_app/Core/Constans/Constans.dart';
import 'package:cce_app/Futures/auth/Login/views/loginviwe.dart';
import 'package:flutter/material.dart';
import 'package:cce_app/Core/manager/imagesManger.dart';

class SplashView extends StatefulWidget {
  static const routeName = 'SplashView';

  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 4 seconds
    Future.delayed(Duration(seconds: Constans.Duration_splash_screen), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fefe),
      body: Center(
        child: Image.asset(Imagesmanger.CCE_Logo), // Display your logo
      ),
    );
  }
}
