import 'package:cce_app/Futures/Home/widget/PopularProfessorsListView.dart';
import 'package:flutter/material.dart';

class PopularProfessorsSection extends StatelessWidget {
  const PopularProfessorsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Professors',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 12),
          const SizedBox(
            height: 200,
            child: PopularProfessorsListView(), // Refactored ListView
          ),
        ],
      ),
    );
  }
}
