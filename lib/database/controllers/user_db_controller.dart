import 'package:bankplus/Prefs/shared_preferences.dart';
import 'package:bankplus/model_db/process_response.dart';
import 'package:bankplus/model_db/regester_user.dart';
import 'package:sqflite/sqflite.dart';

import '../db_controller.dart';

class UserDbController {
  //Login ,Regester

  final Database _database = DbController().database;

  Future<processResponse> login(
      {required String identification, required String password}) async {
    List<Map<String, dynamic>> rowMap = await _database.query(
      User.tableName,
      where: 'identification = ? AND password = ?',
      whereArgs: [identification, password],
    );

    if (rowMap.isNotEmpty) {
      User user = User.fromMap(rowMap.first);
      SharedPrefController().save(user: user);
      return processResponse(message: 'Logged in successfully', success: true);
    }
    return processResponse(
        message: 'Credentials error, checked and try again!');
  }


  Future<processResponse> register({required User user}) async {
    if (await _isEmailExist(identification: user.email)) {
      int newRowId = await _database.insert(User.tableName, user.toMap());
      return processResponse(
        message: newRowId != 0 ? 'Registered successfully' : 'Registered filde',
        success: newRowId != 0,
      );
    } else {
      return processResponse(
        message: 'Email exist, use another',
        success: false,
      );
    }
  }

  Future<bool> _isEmailExist({required String identification}) async {
    //
    List<Map<String, dynamic>> rowMap = await _database.rawQuery(
        'SELECT * FROM user WHERE identification = ?', [identification]);
    return rowMap.isEmpty;
  }
}

