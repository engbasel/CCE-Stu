import 'package:cce_app/Futures/auth/Login/views/loginviwe.dart';
import 'package:cce_app/Futures/OnBoarding/views/OnBoardingView.dart';
import 'package:cce_app/Futures/auth/Signup/views/Signupview.dart';
import 'package:cce_app/Futures/Home/view/homeviwe.dart';
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
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
