import 'package:cce_app/Core/utlis/utilis.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  File? _selectedImage;
  final ScreenUtils screenUtils = ScreenUtils();

  String get _currentDateTime =>
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

  void _saveNote() {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isNotEmpty && content.isNotEmpty) {
      // Handle saving logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Note saved successfully!')),
      );
      _titleController.clear();
      _contentController.clear();
      setState(() {
        _selectedImage = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date and Time: $_currentDateTime',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(),
            if (_selectedImage != null) ...[
              Image.file(_selectedImage!),
              const SizedBox(height: 16),
            ],
            ElevatedButton(
              onPressed: () => screenUtils.pickImage((file) {
                setState(() {
                  _selectedImage = file;
                });
              }),
              child: const Text('Add Photo'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveNote,
                child: const Text('Save Note'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
