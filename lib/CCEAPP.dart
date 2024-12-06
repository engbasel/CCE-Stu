// ignore: camel_case_types
import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:cce_app/Futures/splash/views/splashviwe.dart';
import 'package:cce_app/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CCEAPP extends StatelessWidget {
  const CCEAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        textTheme: GoogleFonts.interTightTextTheme(),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 0)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(width: 0),
            )),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
            primary: ColorsManager.coustomLabelTextColor,
            seedColor: ColorsManager.coustomLabelTextColor),
        useMaterial3: true,
      ),
      home: const SplashView(), // Start with SplashView
    );
  }
}
