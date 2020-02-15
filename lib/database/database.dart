import 'dart:io';
import 'package:news_app/models/news.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper _instance = new DatabaseHelper._();
  String tableName = 'News';

  factory DatabaseHelper.getInstance() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "todo_app.db");
    var theDb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    _db = theDb;
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $tableName ("
        "id INTEGER PRIMARY KEY,"
        "author TEXT,"
        "url TEXT,"
        "urlToImage TEXT,"
        "title TEXT,"
        "description TEXT,"
        "publishedAt TEXT"
        ")");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {}

//id =-1 if fail

  // Message function Start

  Future<int> insertNews(News news) async {
    try {
      Map<String, dynamic> d = News.toJson(news);
      d.remove('source');
      Map<String, dynamic> data = d;
      var dbClient = await db;
      int id = await dbClient.insert(tableName, data);
      print("message inserted" + id.toString());
      return id;
    } catch (e) {
      print(e);
    }
  }

  Future<int> deleteNews(int messageId) async {
    try {
      var dbClient = await db;
      int id = await dbClient.delete(tableName, where: " id = ?", whereArgs: [
        messageId,
      ]);
      return id;
    } catch (e) {
      print(e);
    }
  }

  Future<List<News>> getNews() async {
    try {
      var dbClient = await db;
      List<Map> todoMap = await dbClient.query(tableName);
      return todoMap.map((map) => News.fromJson(map)).toList();
    } catch (e) {
      print(e);
    }
  }

//Message Function End

}
