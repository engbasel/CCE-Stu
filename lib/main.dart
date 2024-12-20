import 'package:cce_app/CCEAPP.dart';
import 'package:cce_app/Futures/Notes/helper/DatabaseHelper.dart';
import 'package:cce_app/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DatabaseHelper().database;

  runApp(
    EasyLocalization(
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('ar'),
      child: const CCEAPP(),
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
    ),
  );
}
