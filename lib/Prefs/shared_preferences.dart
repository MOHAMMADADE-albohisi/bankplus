// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'package:bankplus/model_db/regester_admin_screen.dart';
import 'package:bankplus/model_db/regester_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum savedata { id, name, email, logedInd, userId, userName, admin }

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instancetest;

  factory SharedPrefController() {
    return _instancetest ??= SharedPrefController._();
  }

  Future<void> initPreferTest() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void save({required User user}) {
    _sharedPreferences.setBool(savedata.logedInd.name, true);
  }

  void saveAdmin({required Admin admin}) {
    _sharedPreferences.setBool(savedata.logedInd.name, true);
  }

  void saveUserId({required int UserId}) {
    _sharedPreferences.setInt(savedata.userId.name, UserId);
  }

  void saveUserName({required String UserName}) {
    _sharedPreferences.setString(savedata.userName.name, UserName);
  }

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> removeValueFor(String key) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> claer() {
    return _sharedPreferences.clear();
  }
}
