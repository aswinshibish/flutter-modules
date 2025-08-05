 import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  // Get Database Instance
  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Initialize Database
  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER
          )
        ''');
      },
    );
  }

  // Insert Data
  static Future<void> insertUser(String name, int age) async {
    final db = await getDatabase();
    await db.insert('users', {'name': name, 'age': age});
  }

  // Fetch Data
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await getDatabase();
    return await db.query('users');
  }

  // Delete User
  static Future<void> deleteUser(int id) async {
    final db = await getDatabase();
    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }


// Update User in Database
static Future<void> updateUser(int id, String name, int age) async {
  final db = await getDatabase();
  await db.update(
    'users',
    {'name': name, 'age': age},
    where: 'id = ?',
    whereArgs: [id],
  );
}
}
