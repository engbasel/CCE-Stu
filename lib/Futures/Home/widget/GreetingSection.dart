import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Good Morning, [Student Name]!', // Replace with dynamic name
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
