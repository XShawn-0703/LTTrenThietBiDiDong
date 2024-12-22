// lib/database/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart'; // Giả sử bạn có model User để lưu thông tin người dùng
.
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT
      )
    ''');
  }

  // Phương thức kiểm tra đăng nhập
  Future<bool> login(String username, String password) async {
    final db = await instance.database;

    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    return result.isNotEmpty; // Nếu có ít nhất 1 dòng trả về, đăng nhập thành công
  }

  // Phương thức thêm người dùng vào cơ sở dữ liệu (dùng cho đăng ký)
  Future<int> register(String username, String password) async {
    final db = await instance.database;
    final user = {'username': username, 'password': password};
    return await db.insert('users', user);
  }
}
