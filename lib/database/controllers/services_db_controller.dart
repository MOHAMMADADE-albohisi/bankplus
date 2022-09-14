import 'package:bankplus/database/db_oprations.dart';
import 'package:bankplus/model_db/lone.dart';
import 'package:bankplus/model_db/regester_admin_screen.dart';
import '../../Prefs/shared_preferences.dart';

class ServicesDbController extends DbOperations<Services> {
  @override
  Future<bool> create(Services model) async {
    int test = await database.insert(Services.tableName, model.toMap());
    if (test != 0) {
      return true;
    }
    return false;
  }

  Future<bool> createadmin(Admin admin) async {
    int test = await database.insert(Admin.tableName, admin.toMap());
    if (test != 0) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeleteRows = await database
        .delete(Services.tableName, where: 'id= ?', whereArgs: [id]);
    return countOfDeleteRows == 1;
  }

  @override
  Future<List<Services>> read() async {
    String useId =
        SharedPrefController().getValueFor<String>(savedata.userName.name)!;
    List<Map<String, dynamic>> rowsMap = await database
        .query(Services.tableName, where: 'user_name = ?', whereArgs: [useId]);
    return rowsMap.map((rowsMap) => Services.fromMap(rowsMap)).toList();
  }

  @override
  Future<Services?> show(int id) async {
    List<Map<String, dynamic>> rowsMap = await database
        .query(Services.tableName, where: 'id = ?', whereArgs: [id]);
    return rowsMap.isNotEmpty ? Services.fromMap(rowsMap.first) : null;
  }

  @override
  Future<bool> update(int id, String state) async {
    int countOfUpdateRows = await database.rawUpdate(
      'UPDATE services SET state=? WHERE id=?',
      [state, id],
    );
    return countOfUpdateRows == 1;
  }
}
