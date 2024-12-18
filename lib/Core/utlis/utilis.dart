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

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Night';
    }
  }

  /// Helper function to get initials from the professor's name
  static String getInitials(String? name) {
    if (name == null || name.isEmpty) return 'no Given';
    List<String> splitName = name.split(' ');
    if (splitName.length >= 2) {
      return '${splitName[0][0]}${splitName[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  static String formatText(String text, int maxWordsPerLine) {
    final words = text.split(' ');
    List<String> lines = [];
    for (int i = 0; i < words.length; i += maxWordsPerLine) {
      lines.add(words
          .sublist(i, (i + maxWordsPerLine).clamp(0, words.length))
          .join(' '));
    }
    return lines.join('\n');
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

  String? stduValidatorfunc(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@std\.mans\.edu\.eg$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email from std.mans.edu.eg';
    }

    return null;
  }
}
