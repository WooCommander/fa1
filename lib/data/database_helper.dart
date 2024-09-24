import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../data/models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age INTEGER
      )
      ''',
    );
  }

  // Метод для добавления пользователя
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', {'name': user.name, 'age': user.age});
  }

  // Метод для получения пользователя
  Future<User?> getUser(int id) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return User(name: maps.first['name'], age: maps.first['age']);
    }
    return null;
  }

  // Метод для обновления пользователя
  Future<int> updateUser(User user, int id) async {
    final db = await database;
    return await db.update(
      'users',
      {'name': user.name, 'age': user.age},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
