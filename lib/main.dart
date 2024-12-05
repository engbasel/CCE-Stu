import 'package:cce_app/Futures/Home/view/homeviwe.dart';
import 'package:cce_app/Futures/auth/Login/views/loginviwe.dart';
import 'package:cce_app/router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart'; // Automatically generated for your project
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        textTheme: GoogleFonts.interTightTextTheme(),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor:Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 0.5
              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),


          )

        ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginView(), // Start with SplashView
    );
  }
}
