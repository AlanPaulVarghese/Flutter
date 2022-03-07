import 'package:sqflite/sqflite.dart' as sq;
import 'package:path/path.dart';

class MoneyDatabase {
  MoneyDatabase._init();
  static final MoneyDatabase obj = MoneyDatabase._init();
  static sq.Database? _database;
  Future<sq.Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb("money.db");
    return _database;
  }

  Future<sq.Database> initDb(String fPath) async {
    final dbPath = await sq.getDatabasesPath();
    final path = join(dbPath, fPath);
    return sq.openDatabase(path, version: 1, onCreate: (db, path) async {
      await db.execute(
          "CREATE TABLE moneyTable(id INTEGER PRIMARY KEY, title TEXT, value REAL, moneyType INTEGER,cat INTEGER,date TEXT)");
    });
  }

  static Future<int> create(Map<String, Object> data) async {
    final db = await obj.database;
    return await db!.insert("moneyTable", data);
  }

  static Future<List<Map<String, Object?>>> read() async {
    final db = await obj.database;
    final res = await db!.query('moneyTable');
    List<Map<String, Object?>> resData = List<Map<String, Object?>>.from(res);
    return resData;
  }

  static Future<int> delete(int id) async {
    final db = await obj.database;
    final res = await db!.delete('moneyTable', where: "id= ?", whereArgs: [id]);
    return res;
  }

  Future close() async {
    final db = await obj.database;
    db!.close();
  }
}
