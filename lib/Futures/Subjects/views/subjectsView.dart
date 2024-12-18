import 'package:cce_app/Futures/Home/widget/buildLevelSection.dart';
import 'package:flutter/material.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Wrap the content in a Center widget to center horizontally
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center items vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center items horizontally
          children: [
            const SizedBox(height: 60), // Top spacing
            buildLevelSection(
              context,
              'Level 000',
              collapsedColor: const Color(0xffb8e7f5),
              expandedColor: const Color(0xffb8e7f5),
            ),
            const SizedBox(height: 15), // Spacing between levels
            buildLevelSection(
              context,
              'Level 100',
              collapsedColor: const Color(0xffa6d0dd),
              expandedColor: const Color(0xffa6d0dd),
            ),
            const SizedBox(height: 15),
            buildLevelSection(
              context,
              'Level 200',
              collapsedColor: const Color(0xff93b9c4),
              expandedColor: const Color(0xff93b9c4),
            ),
            const SizedBox(height: 15),
            buildLevelSection(
              context,
              'Level 300',
              collapsedColor: const Color(0xff6e8b93),
              expandedColor: const Color(0xff6e8b93),
            ),
            const SizedBox(height: 15),
            buildLevelSection(
              context,
              'Level 400',
              collapsedColor: const Color(0xff53686e),
              expandedColor: const Color(0xff53686e),
            ),
            const SizedBox(height: 60), // Bottom spacing
          ],
        ),
      ),
    );
  }
}
