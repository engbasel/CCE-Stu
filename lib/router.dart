import 'package:cce_app/Futures/Login/views/loginviwe.dart';
import 'package:cce_app/Futures/OnBoarding/views/OnBoardingView.dart';
import 'package:cce_app/Futures/Signup/views/Signupview.dart';
import 'package:cce_app/Futures/homeview/homeviwe.dart';
import 'package:cce_app/Futures/splash/views/splashviwe.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => const HomePage());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
