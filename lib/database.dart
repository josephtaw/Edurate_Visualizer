import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'edurate.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Table for storing user accounts
    await db.execute('''
      CREATE TABLE accounts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        full_name TEXT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');

    // Table for storing courses
    await db.execute('''
      CREATE TABLE courses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        department TEXT,
        course_name TEXT
      )
    ''');

    // Insert initial courses for CSCE
    await db.insert('courses', {'department': 'CSCE', 'course_name': 'Digital Design I'});
    await db.insert('courses', {'department': 'CSCE', 'course_name': 'Digital Design I lab'});
    await db.insert('courses', {'department': 'CSCE', 'course_name': 'Fundamentals of Computing I'});
    await db.insert('courses', {'department': 'CSCE', 'course_name': 'Programming in Java'});
    await db.insert('courses', {'department': 'CSCE', 'course_name': 'Computer Architecture'});
  }

  Future<List<Map<String, dynamic>>> getCoursesByDepartment(String department) async {
    final db = await database;
    return db.query('courses', where: 'department = ?', whereArgs: [department]);
  }

  Future<void> insertAccount(String fullName, String email, String password) async {
    final db = await database;
    await db.insert('accounts', {
      'full_name': fullName,
      'email': email,
      'password': password,
    });
  }

  Future<Map<String, dynamic>?> getAccount(String email, String password) async {
    final db = await database;
    final result = await db.query('accounts',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    return result.isNotEmpty ? result.first : null;
  }
}
