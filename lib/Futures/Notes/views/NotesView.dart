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
  bool _isGridView = true; // Variable to track view type

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  // Fetch notes using DatabaseHelper
  Future<void> _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });
    final data = await DatabaseHelper().getNotes();
    setState(() {
      _notes = data;
      _isLoading = false;
    });
  }

  // Delete note
  Future<void> _deleteNote(int id) async {
    await DatabaseHelper().deleteNote(id);
    _fetchNotes();
  }

  void _editNote(Map<String, dynamic> note) {
    final titleController = TextEditingController(text: note['title']);
    final contentController = TextEditingController(text: note['content']);
    final imagePathController =
        TextEditingController(text: note['image_path'] ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Note', textAlign: TextAlign.center),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: 5,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: imagePathController,
                decoration: const InputDecoration(labelText: 'Image Path'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final updatedNote = {
                'id': note['id'],
                'title': titleController.text,
                'content': contentController.text,
                'image_path': imagePathController.text,
                'date_time': note['date_time'], // Keep the original date_time
              };
              await DatabaseHelper().updateNote(updatedNote);
              Navigator.pop(context);
              _fetchNotes(); // Refresh the notes list
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  // Show note details in dialog
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Notes'),
        actions: [
          IconButton(
            icon: Icon(
              _isGridView ? Icons.view_list : Icons.grid_view, // Toggle icon
            ),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView; // Toggle between grid and list
              });
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _notes.isEmpty
              ? const Center(child: Text('No notes found.'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _isGridView
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
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
                        )
                      : ListView.builder(
                          itemCount: _notes.length,
                          itemBuilder: (context, index) {
                            final note = _notes[index];
                            return GestureDetector(
                              onTap: () => _showNoteDetails(note),
                              child: Card(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: ListTile(
                                  title: Text(note['title']),
                                  subtitle: Text(note['content']),
                                  leading: Icon(Icons.note),
                                  onTap: () => _showNoteDetails(note),
                                ),
                              ),
                            );
                          },
                        ),
                ),
    );
  }
}
