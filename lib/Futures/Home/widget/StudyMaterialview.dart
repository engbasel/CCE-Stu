import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudyMaterial extends StatelessWidget {
  const StudyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Study Materials',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorsManager.AppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // YouTube Channel Section
            buildSectionHeader('YouTube Channels', Colors.redAccent),
            buildCard(
              context,
              iconPath: 'assets/General/youtube.svg',
              title: 'CCE Tutorials',
              description: 'Curated video tutorials for students.',
              color: Colors.redAccent,
              onTap: () {
                // Add action here
              },
            ),
            buildCard(
              context,
              iconPath: 'assets/General/youtube.svg',
              title: 'Advanced Programming',
              description: 'In-depth programming tutorials.',
              color: Colors.redAccent,
              onTap: () {
                // Add action here
              },
            ),

            const SizedBox(height: 16),

            // Google Drive Resources Section
            buildSectionHeader('Google Drive Resources', Colors.greenAccent),
            buildCard(
              context,
              iconPath: 'assets/General/google-drive.svg',
              title: 'Lecture Notes',
              description: 'Access lecture slides and notes.',
              color: Colors.green,
              onTap: () {
                // Add action here
              },
            ),
            buildCard(
              context,
              iconPath: 'assets/General/google-drive.svg',
              title: 'Lab Manuals',
              description: 'Download lab resources and guides.',
              color: Colors.green,
              onTap: () {
                // Add action here
              },
            ),

            const SizedBox(height: 16),

            // Summary Section
            buildSectionHeader('Student Summaries', Colors.orangeAccent),
            buildCard(
              context,
              iconPath: 'assets/General/notes.svg',
              title: 'Topic Summaries',
              description: 'Student-created summaries of key topics.',
              color: Colors.orange,
              onTap: () {
                // Add action here
              },
            ),
            buildCard(
              context,
              iconPath: 'assets/General/notes.svg',
              title: 'Past Exams',
              description: 'Summaries from past year exams.',
              color: Colors.orange,
              onTap: () {
                // Add action here
              },
            ),

            const SizedBox(height: 16),

            // Additional Resources Section
            buildSectionHeader('Additional Materials', Colors.blueAccent),
            buildCard(
              context,
              iconPath: 'assets/General/books.svg',
              title: 'Professor Resources',
              description: 'Extra materials shared by professors.',
              color: Colors.blue,
              onTap: () {
                // Add action here
              },
            ),
            buildCard(
              context,
              iconPath: 'assets/General/books.svg',
              title: 'Reference Books',
              description: 'Recommended books for further reading.',
              color: Colors.blue,
              onTap: () {
                // Add action here
              },
            ),

            const SizedBox(height: 16),

            // External Learning Resources Section
            buildSectionHeader('External Resources', Colors.purpleAccent),
            buildCard(
              context,
              iconPath: 'assets/General/web.svg',
              title: 'Online Courses',
              description: 'Free and paid online learning platforms.',
              color: Colors.purple,
              onTap: () {
                // Add action here
              },
            ),
            buildCard(
              context,
              iconPath: 'assets/General/web.svg',
              title: 'Technical Blogs',
              description: 'Blogs and articles for deep learning.',
              color: Colors.purple,
              onTap: () {
                // Add action here
              },
            ),

            const SizedBox(height: 16),

            // FAQs Section
            buildSectionHeader('FAQs', Colors.teal),
            buildCard(
              context,
              iconPath: 'assets/General/help.svg',
              title: 'Common Questions',
              description: 'Find answers to frequently asked questions.',
              color: Colors.teal,
              onTap: () {
                // Add action here
              },
            ),
            buildCard(
              context,
              iconPath: 'assets/General/help.svg',
              title: 'Technical Support',
              description: 'Get help with technical issues.',
              color: Colors.teal,
              onTap: () {
                // Add action here
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context,
      {required String iconPath,
      required String title,
      required String description,
      required Color color,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color,
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(description),
          onTap: onTap,
        ),
      ),
    );
  }
}
