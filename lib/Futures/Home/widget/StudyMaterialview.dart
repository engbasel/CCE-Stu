import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudyMaterial extends StatelessWidget {
  const StudyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Materials'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // YouTube Channel Section
            _buildSectionHeader('YouTube Channels'),
            _buildCard(
              context,
              iconPath:
                  'assets/General/youtube.svg', // Path to YouTube SVG icon
              title: 'CCE Tutorials',
              description: 'Curated video tutorials for students.',
              color: Colors.redAccent,
              onTap: () {
                // Open YouTube channel link
              },
            ),

            const SizedBox(height: 16),

            // Google Drive Folders Section
            _buildSectionHeader('Google Drive Resources'),
            _buildCard(
              context,
              iconPath:
                  'assets/General/google-drive.svg', // Path to Google Drive SVG icon
              title: 'Course Materials',
              description: 'Access lecture notes, slides, and guides.',
              color: Colors.greenAccent,
              onTap: () {
                // Open Google Drive link
              },
            ),

            const SizedBox(height: 16),

            // Summary from Students Section
            _buildSectionHeader('Summaries from Students'),
            _buildCard(
              context,
              iconPath:
                  'assets/General/google-drive.svg', // Placeholder for notes icon
              title: 'Shared Notes',
              description: 'Student-written summaries of key topics.',
              color: Colors.orangeAccent,
              onTap: () {
                // Navigate to summaries section or link
              },
            ),

            const SizedBox(height: 16),

            // Additional Material Section
            _buildSectionHeader('Additional Materials'),
            _buildCard(
              context,
              iconPath:
                  'assets/General/google-drive.svg', // Placeholder for books icon
              title: 'Related Resources',
              description: 'Additional readings and materials from professors.',
              color: Colors.blueAccent,
              onTap: () {
                // Open materials or show additional options
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String iconPath,
      required String title,
      required String description,
      required Color color,
      required VoidCallback onTap}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}
