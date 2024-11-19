import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundScaffoldColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorsManager.AppBarColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Account Section
          _buildSectionHeader('Account'),
          _buildListTile(
            icon: Icons.person,
            title: 'Edit Profile',
            subtitle: 'Update your personal details',
            onTap: () {
              // Navigate to edit profile page
            },
          ),
          _buildListTile(
            icon: Icons.lock,
            title: 'Change Password',
            subtitle: 'Update your account password',
            onTap: () {
              // Navigate to change password page
            },
          ),

          const SizedBox(height: 16),

          // Preferences Section
          _buildSectionHeader('Preferences'),
          _buildListTile(
            icon: Icons.brightness_6,
            title: 'Theme',
            subtitle: 'Switch between Light and Dark mode',
            trailing: _buildThemeToggle(context),
          ),
          _buildListTile(
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Manage notification settings',
            onTap: () {
              // Navigate to notification settings
            },
          ),

          const SizedBox(height: 16),

          // Support & Feedback Section
          _buildSectionHeader('Support & Feedback'),
          _buildListTile(
            icon: Icons.help_outline,
            title: 'Contact Support',
            subtitle: 'Get help or report an issue',
            onTap: () {
              // Navigate to contact support page
            },
          ),
          _buildListTile(
            icon: Icons.feedback_outlined,
            title: 'Send Feedback',
            subtitle: 'Share your thoughts with us',
            onTap: () {
              // Navigate to feedback form
            },
          ),

          const SizedBox(height: 16),

          // About Section
          _buildSectionHeader('About'),
          _buildListTile(
            icon: Icons.info_outline,
            title: 'Privacy Policy',
            subtitle: 'Learn about our privacy practices',
            onTap: () {
              // Navigate to privacy policy page
            },
          ),
          _buildListTile(
            icon: Icons.app_settings_alt,
            title: 'App Version',
            subtitle: 'Version 1.0.0',
            onTap: () {
              // Show version info
            },
          ),

          const SizedBox(height: 16),

          // Logout Button
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // Perform logout action
              },
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.buttonColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper: Section Header
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorsManager.coustomLabelTextColor,
        ),
      ),
    );
  }

  // Helper: List Tile
  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: ColorsManager.AppBarColor,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: trailing,
      onTap: onTap,
    );
  }

  // Helper: Theme Toggle
  Widget _buildThemeToggle(BuildContext context) {
    return Switch(
      value: Theme.of(context).brightness == Brightness.dark,
      onChanged: (value) {
        // Toggle between light and dark theme
        // Add theme-changing logic here
      },
      activeColor: ColorsManager.buttonColor,
    );
  }
}
