import 'package:flutter/material.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header for the Notes and Reminders section
        Text(
          'Personal Reminders & Notes',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
        ),
        const SizedBox(height: 12.0),

        // Quick Reminders Section
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.alarm, color: Colors.blueAccent),
                  const SizedBox(width: 10),
                  Text(
                    'Upcoming Reminders',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Example reminders with Icons
              ListTile(
                leading:
                    const Icon(Icons.circle, color: Colors.orange, size: 10),
                title: const Text("Study for upcoming quiz"),
                subtitle: Text("Due: Nov 18"),
              ),
              ListTile(
                leading: const Icon(Icons.circle, color: Colors.red, size: 10),
                title: const Text("Submit project report"),
                subtitle: Text("Due: Nov 20"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),

        // Note-taking Button with Icon
        ElevatedButton.icon(
          onPressed: () {
            // Navigate to note-taking section
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          icon: const Icon(Icons.note_add, color: Colors.white),
          label: const Text(
            'Take Notes',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
