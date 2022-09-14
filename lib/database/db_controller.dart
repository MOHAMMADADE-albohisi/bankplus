// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  DbController._();

  late Database _database;

  static DbController? _instance;

  factory DbController() {
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app.db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database database) {},
      onCreate: (Database database, int version) async {
        await database.execute('CREATE TABLE user('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'identification TEXT NOT NULL,'
            'name TEXT NOT NULL,'
            'email TEXT NOT NULL,'
            'phoneNumber TEXT NOT NULL,'
            'password TEXT NOT NULL,'
            'accountNumber TEXT NOT NULL,'
            'gender TEXT NOT NULL,'
            'userImage TEXT NOT NULL,'
            'branch TEXT NOT NULL '
            ')');
        await database.execute('CREATE TABLE admin('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'email TEXT NOT NULL,'
            'password TEXT NOT NULL,'
            'branch TEXT NOT NULL '
            ')');

        await database.execute('CREATE TABLE services('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'typeName TEXT NOT NULL,'
            'amount INTEGER NOT NULL,'
            'info TEXT NOT NULL,'
            'state TEXT DEFAULT \'waiting\','
            'infoLoan TEXT DEFAULT Null,'
            'document TEXT  DEFAULT NULL,'
            'date TEXT DEFAULT NULL,'
            'user_name TEXT,'
            'FOREIGN KEY (user_name) references user(name)'
            ')');
      },
      onUpgrade: (Database database, int oldVersion, int newVersion) {},
      onDowngrade: (Database database, int oldVersion, int newVersion) {},
    );
  }
}
