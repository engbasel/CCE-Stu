import 'package:flutter/material.dart';

class ProfileViewboady extends StatelessWidget {
  const ProfileViewboady({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    'assets/images/profile.png'), // Replace with dynamic image
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement functionality to change the profile picture
              },
              child: const Text('Change Profile Picture'),
            ),
            const SizedBox(height: 24),

            // Personal Information Section
            ProfileSection(
              sectionTitle: 'Personal Information',
              children: [
                ProfileInfoRow(label: 'Name:', value: 'John Doe'),
                ProfileInfoRow(label: 'Student ID:', value: '20230001'),
                ProfileInfoRow(label: 'Email:', value: 'john.doe@example.com'),
              ],
            ),

            const SizedBox(height: 24),

            // Academic Information Section
            ProfileSection(
              sectionTitle: 'Academic Information',
              children: [
                ProfileInfoRow(label: 'Level:', value: 'Level 300'),
                ProfileInfoRow(label: 'GPA:', value: '3.5'),
                ProfileInfoRow(label: 'Major:', value: 'Computer Science'),
              ],
            ),

            const SizedBox(height: 24),

            // Achievements Section
            ProfileSection(
              sectionTitle: 'Achievements',
              children: [
                ProfileInfoRow(label: 'Awards:', value: 'Best Student 2023'),
                ProfileInfoRow(
                    label: 'Projects:', value: '5 completed projects'),
              ],
            ),

            const SizedBox(height: 24),

            // Career Goals Section
            ProfileSection(
              sectionTitle: 'Career Goals',
              children: [
                const Text(
                  'Become a software engineer at a top tech company.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Contact Information Section
            ProfileSection(
              sectionTitle: 'Contact Information',
              children: [
                ProfileInfoRow(label: 'Phone:', value: '+20 100 000 0000'),
                ProfileInfoRow(
                    label: 'LinkedIn:', value: 'linkedin.com/in/johndoe'),
              ],
            ),

            const SizedBox(height: 24),

            // Settings Section
            ProfileSection(
              sectionTitle: 'Settings',
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the settings screen
                  },
                  child: const Text('Edit Profile'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Notifications Section
            ProfileSection(
              sectionTitle: 'Notifications',
              children: [
                ProfileInfoRow(label: 'New Messages:', value: '3 unread'),
                ProfileInfoRow(label: 'Events:', value: '2 upcoming events'),
              ],
            ),

            const SizedBox(height: 24),

            // Logout Section
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement logout functionality
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String sectionTitle;
  final List<Widget> children;

  const ProfileSection(
      {super.key, required this.sectionTitle, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sectionTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(value),
        ],
      ),
    );
  }
}
