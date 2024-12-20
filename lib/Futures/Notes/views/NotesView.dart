import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cce_app/Futures/Notes/helper/DatabaseHelper.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  List<Map<String, dynamic>> _notes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  Future<void> _fetchNotes() async {
    final data = await DatabaseHelper().getNotes();
    setState(() {
      _notes = data;
      _isLoading = false;
    });
  }

  Future<void> _deleteNote(int id) async {
    await DatabaseHelper().deleteNote(id);
    _fetchNotes();
  }

  void _editNote(Map<String, dynamic> note) {
    // Navigate to an edit screen (implementation needed)
  }

  void _showNoteDetails(Map<String, dynamic> note) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(note['title'], textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (note['image_path'] != null)
              Image.file(File(note['image_path'])),
            const SizedBox(height: 16),
            Text(note['content'], textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(
              'Created: ${note['date_time']}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteNote(note['id']);
            },
            child: const Text('Delete'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _editNote(note);
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _notes.isEmpty
              ? const Center(child: Text('No notes found.'))
              : Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      final note = _notes[index];
                      return GestureDetector(
                        onTap: () => _showNoteDetails(note),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0x4c79e0ee),
                          ),
                          child: Center(
                            child: Text(
                              note['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
