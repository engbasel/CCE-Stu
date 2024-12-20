import 'package:cce_app/Core/utlis/utilis.dart';
import 'package:cce_app/Futures/Notes/helper/DatabaseHelper.dart';
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

  Future<void> _saveNote() async {
    try {
      print('Starting note saving process...');

      final title = _titleController.text.trim();
      final content = _contentController.text.trim();
      final dateTime =
          _currentDateTime.toString(); // Ensure date is in string format
      final imagePath = _selectedImage?.path ?? '';

      print(
          'Validating note data - Title: $title, Content length: ${content.length}');

      if (title.isNotEmpty && content.isNotEmpty) {
        // Prepare the note data
        final note = {
          'title': title,
          'content': content,
          'date_time': dateTime,
          'image_path': imagePath,
        };

        print('Prepared note data: $note');

        // Create a single instance of DatabaseHelper
        final dbHelper = DatabaseHelper();

        try {
          // Save the note in the database
          final insertedId = await dbHelper.insertNote(note);
          print('Note saved successfully with ID: $insertedId');

          // Show success message
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Note saved successfully!'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }

          // Clear the form
          _titleController.clear();
          _contentController.clear();

          if (mounted) {
            setState(() {
              _selectedImage = null;
            });
          }

          print('Form cleared successfully');
        } catch (dbError) {
          print('Database error while saving note: $dbError');
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error saving note: ${dbError.toString()}'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        }
      } else {
        print('Validation failed: Empty title or content');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please fill in both title and content.'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      print('Unexpected error in _saveNote: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An unexpected error occurred: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  String get _currentDateTime =>
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: const Text(
          'Create Note',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              decoration: const InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            _selectedImage == null
                ? GestureDetector(
                    onTap: () => screenUtils.pickImage((file) {
                      setState(() {
                        _selectedImage = file;
                      });
                    }),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                          const Text(
                            'Note something down or click on image to upload image',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => screenUtils.pickImage((file) {
                      setState(() {
                        _selectedImage = file;
                      });
                    }),
                    child: Image.file(
                      _selectedImage!,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
            const SizedBox(height: 16),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveNote,
                child: const Text('Save Note'),
              ),
            ),

            //   Text('Date and Time: $_currentDateTime',
            //       style: const TextStyle(fontSize: 16)),
            //   const SizedBox(height: 16),
            //   TextField(
            //     controller: _titleController,
            //     decoration: const InputDecoration(
            //       labelText: 'Title',
            //       border: OutlineInputBorder(),
            //     ),
            //   ),
            //   const SizedBox(height: 16),
            //   TextField(
            //     controller: _contentController,
            //     maxLines: 5,
            //     decoration: const InputDecoration(
            //       labelText: 'Content',
            //       border: OutlineInputBorder(),
            //     ),
            //   ),
            //   const SizedBox(),
            //   if (_selectedImage != null) ...[
            //     Image.file(_selectedImage!),
            //     const SizedBox(height: 16),
            //   ],
            //   ElevatedButton(
            //     onPressed: () => screenUtils.pickImage((file) {
            //       setState(() {
            //         _selectedImage = file;
            //       });
            //     }),
            //     child: const Text('Add Photo'),
            //   ),
            //   const SizedBox(height: 16),
            //   SizedBox(
            //     width: double.infinity,
            //     child: ElevatedButton(
            //       onPressed: _saveNote,
            //       child: const Text('Save Note'),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
