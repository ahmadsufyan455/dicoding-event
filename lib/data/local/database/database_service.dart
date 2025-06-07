import 'package:dicoding_event/data/models/event_favorite_table.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class DatabaseService {
  static const String _databaseName = 'event.db';
  static const String _tableName = 'event_favorite';
  static const int _version = 1;

  Future<void> createTables(Database database) async {
    await database.execute(
      '''CREATE TABLE $_tableName(id INTEGER PRIMARY KEY NOT NULL,
      name TEXT,
      summary TEXT,
      description TEXT,
      imageLogo TEXT,
      mediaCover TEXT,
      category TEXT,
      ownerName TEXT,
      cityName TEXT,
      quota INTEGER,
      registrants INTEGER,
      beginTime TEXT,
      endTime TEXT,
      link TEXT
      )
      ''',
    );
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/$_databaseName';
    return openDatabase(
      databasePath,
      version: _version,
      onCreate: (db, version) async {
        await createTables(db);
      },
    );
  }

  Future<int> insertEventFavorite(EventFavoriteTable event) async {
    final db = await _initDb();
    return await db.insert(_tableName, event.toJson());
  }

  Future<int> removeEventFavorite(int id) async {
    final db = await _initDb();
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<EventFavoriteTable>> getEventFavorites() async {
    final db = await _initDb();
    final List<Map<String, dynamic>> results = await db.query(_tableName);
    return results
        .map((result) => EventFavoriteTable.fromJson(result))
        .toList();
  }

  Future<EventFavoriteTable?> getEventFavoriteById(int id) async {
    final db = await _initDb();
    final results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (results.isNotEmpty) {
      return results.map((event) => EventFavoriteTable.fromJson(event)).first;
    } else {
      return null;
    }
  }
}
