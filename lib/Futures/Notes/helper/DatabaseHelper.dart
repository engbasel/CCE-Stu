import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper.internal();

  Future<Database> get database async {
    print('Getting database instance...');
    if (_database != null) {
      print('Returning existing database instance');
      return _database!;
    }
    _database = await _initDatabase();
    print('Returning newly initialized database instance');
    return _database!;
  }

  Future<Database> _initDatabase() async {
    print('Initializing database...');
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = "${documentsDirectory.path}/notes.db";
      print('Database path: $path');

      // Make sure the directory exists
      await Directory(documentsDirectory.path).create(recursive: true);

      var db = await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
        onOpen: (db) {
          print('Database opened successfully');
        },
      );
      print('Database initialized successfully');
      return db;
    } catch (e) {
      print('Error initializing database: $e');
      rethrow;
    }
  }

  Future _onCreate(Database db, int version) async {
    print('Creating database tables...');
    try {
      await db.execute('''
        CREATE TABLE notes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT,
          date_time TEXT,
          image_path TEXT
        )
      ''');
      print('Tables created successfully');
    } catch (e) {
      print('Error creating tables: $e');
      rethrow;
    }
  }

  Future<int> insertNote(Map<String, dynamic> note) async {
    print('Inserting note: $note');
    try {
      Database db = await database;
      int id = await db.insert('notes', note);
      print('Note inserted successfully with id: $id');
      return id;
    } catch (e) {
      print('Error inserting note: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    print('Fetching all notes...');
    try {
      Database db = await database;
      var notes = await db.query('notes');
      print('Retrieved ${notes.length} notes');
      return notes;
    } catch (e) {
      print('Error fetching notes: $e');
      rethrow;
    }
  }

  Future<int> updateNote(Map<String, dynamic> note) async {
    print('Updating note: $note');
    try {
      Database db = await database;
      int count = await db.update(
        'notes',
        note,
        where: 'id = ?',
        whereArgs: [note['id']],
      );
      print('Note updated successfully. Rows affected: $count');
      return count;
    } catch (e) {
      print('Error updating note: $e');
      rethrow;
    }
  }

  Future<int> deleteNote(int id) async {
    print('Deleting note with id: $id');
    try {
      Database db = await database;
      int count = await db.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [id],
      );
      print('Note deleted successfully. Rows affected: $count');
      return count;
    } catch (e) {
      print('Error deleting note: $e');
      rethrow;
    }
  }
}
