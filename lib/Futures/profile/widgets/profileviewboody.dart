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
            const SizedBox(height: 16),

            // Personal Information Section
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ProfileInfoRow(label: 'Name:', value: 'John Doe'),
            ProfileInfoRow(label: 'Student ID:', value: '20230001'),
            ProfileInfoRow(label: 'Email:', value: 'john.doe@example.com'),
            const SizedBox(height: 16),

            // Academic Information Section
            const Text(
              'Academic Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ProfileInfoRow(label: 'Level:', value: 'Level 300'),
            ProfileInfoRow(label: 'GPA:', value: '3.5'),
            ProfileInfoRow(label: 'Major:', value: 'Computer Science'),
            const SizedBox(height: 16),

            // Achievements Section
            const Text(
              'Achievements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ProfileInfoRow(label: 'Awards:', value: 'Best Student 2023'),
            ProfileInfoRow(label: 'Projects:', value: '5 completed projects'),
            const SizedBox(height: 16),

            // Career Goals Section
            const Text(
              'Career Goals',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Become a software engineer at a top tech company.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Contact Information Section
            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ProfileInfoRow(label: 'Phone:', value: '+20 100 000 0000'),
            ProfileInfoRow(
                label: 'LinkedIn:', value: 'linkedin.com/in/johndoe'),
            const SizedBox(height: 16),

            // Settings Section
            const Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Navigate to the settings screen
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 16),

            // Notifications Section
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ProfileInfoRow(label: 'New Messages:', value: '3 unread'),
            ProfileInfoRow(label: 'Events:', value: '2 upcoming events'),
            const SizedBox(height: 16),

            // Logout Section
            ElevatedButton(
              onPressed: () {
                // Implement logout functionality
              },
              child: const Text('Logout'),
            ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(value),
      ],
    );
  }
}
