import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  final String studentName;

  const GreetingSection({Key? key, required this.studentName})
      : super(key: key);

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_getGreeting()}, $studentName!',
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
