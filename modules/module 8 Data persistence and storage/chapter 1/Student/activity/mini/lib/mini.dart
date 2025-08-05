import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Note {
  final int? id;
  final String title;
  final String content;

  Note({this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}

class DBHelper {
  static Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'note.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertNote(Note note) async {
    final db = await DBHelper.database();
    await db.insert('notes', note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Note>> getNote() async {
    final db = await DBHelper.database();
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
      );
    });
  }

  static Future<int> updateNote(int id, String title, String content) async {
    final db = await DBHelper.database();
    return await db.update(
      'notes',
      {
        'title': title,
        'content': content,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> deleteNote(int id) async {
    final db = await DBHelper.database();
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
