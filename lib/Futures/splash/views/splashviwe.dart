import 'package:cce_app/Core/helpers/styles.dart';
import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:flutter/material.dart';
import 'package:cce_app/Core/utlis/utilis.dart';
import 'package:cce_app/Core/Constans/Constans.dart';
import 'package:cce_app/Futures/auth/Login/views/loginviwe.dart';
import 'package:cce_app/Core/manager/imagesManger.dart';

class SplashView extends StatefulWidget {
  static const routeName = 'SplashView';

  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final ScreenUtils screenUtils = ScreenUtils();

  @override
  void initState() {
    super.initState();

    _handleSplashNavigation();
  }

  Future<void> _handleSplashNavigation() async {
    bool hasSeenSplash = await screenUtils.hasSeenSplashScreen();

    if (hasSeenSplash) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    } else {
      await screenUtils.markSplashScreenAsSeen();

      Future.delayed(Duration(seconds: Constans.splashScreenDuration), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundScaffoldColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Image.asset(Imagesmanger.CCE_Logo),
            SizedBox(height: 20),
            Spacer(flex: 5),
            Text(
              'L o a d i n g ...',
              style: Ktextstyle24Wite700,
            ),
            Spacer(),
          ],
        ), // Display your logo
      ),
    );
  }
}
