import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cce_app/Futures/splash/views/splashviwe.dart';
import 'firebase_options.dart'; // Automatically generated for your project

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Make sure you have this set up
  );
  runApp(const CCE_APP());
}

// ignore: camel_case_types
class CCE_APP extends StatelessWidget {
  const CCE_APP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CCE App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashView(), // Start with SplashView
    );
  }
}
