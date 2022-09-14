import 'package:bankplus/Prefs/shared_preferences.dart';
import 'package:bankplus/model_db/lone.dart';
import 'package:bankplus/model_db/process_response.dart';
import 'package:bankplus/model_db/regester_admin_screen.dart';
import 'package:sqflite/sqflite.dart';

import '../db_controller.dart';

class AdminDbController {
  //Login ,Regester

  final Database _database = DbController().database;

  Future<processResponse> login({required String email, required String password}) async {
    List<Map<String, dynamic>> rowMap = await _database.query(
      Admin.tableName,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (rowMap.isNotEmpty) {
      Admin admin = Admin.fromMap(rowMap.first);
      SharedPrefController().saveAdmin(admin: admin);
      return processResponse(message: 'Logged in successfully', success: true);
    }
    return processResponse(
        message: 'Credentials error, checked and try again!');
  }

  Future<List<Services>> read() async {
    List<Map<String, dynamic>> rowsMap =
        await _database.query(Services.tableName);
    return rowsMap.map((rowsMap) => Services.fromMap(rowsMap)).toList();
  }

  Future<List<Services>> readOne(int id) async {
    List<Map<String, dynamic>> rowsMap =
    await _database.query(Services.tableName,where: 'id=?',whereArgs: [id]);
    return rowsMap.map((rowsMap) => Services.fromMap(rowsMap)).toList();
  }

}
