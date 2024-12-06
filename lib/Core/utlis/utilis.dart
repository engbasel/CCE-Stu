import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ScreenUtils {
  static const String splashViewedKey = 'splash_viewed';

  // Method to check if splash view has been seen before
  Future<bool> hasSeenSplashScreen() async {
    print('Checking if splash screen has been viewed...');
    final prefs = await SharedPreferences.getInstance();
    bool hasSeen = prefs.getBool(splashViewedKey) ?? false;
    print('Splash screen viewed status: $hasSeen');
    return hasSeen;
  }

  // Method to mark splash screen as seen
  Future<void> markSplashScreenAsSeen() async {
    print('Marking splash screen as seen...');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(splashViewedKey, true);
    print('Splash screen marked as seen.');
  }

  void initializeScreen(String screenName) {
    // Log the initialization for debugging
    print('Initializing screen: $screenName');
    debugPrint('$screenName Initialized');
  }
}
