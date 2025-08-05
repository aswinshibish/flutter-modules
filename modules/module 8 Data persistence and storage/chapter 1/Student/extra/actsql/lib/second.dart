import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';


class DatabaseHelper {
  static Database? _database;
  static const String tableName= 'users';

  // Get Database Instance
   Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize Database
   Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return
        db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER
          )
        ''');
      },
    );
  }

  // Insert Data
   Future<int> insertUser(String name, int age) async {
    final db = await database;
   return
    await db.insert(tableName, {'name': name, 'age': age});
  }

  // Fetch Data
   Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query(tableName);
  }

  // Delete User
   


// Update User in Database
 Future<int> updateUser(int id, String name, int age) async {
  final db = await database;
  return
  await db.update(
    tableName,
    {'name': name, 'age': age},
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<int> deleteUser(int id) async {
    final db = await database;
    return
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
    }
