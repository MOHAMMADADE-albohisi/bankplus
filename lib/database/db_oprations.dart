import 'package:bankplus/database/db_controller.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbOperations<Model> {
  final Database database = DbController().database;

  Future<bool> create(Model model);

  Future<List<Model>> read();

  Future<Model?> show(int id);

  Future<bool> update(int id,String state);

  Future<bool> delete(int id);

//دالة الحدف الكامل لجميع العناصر دالة اختيارة وليست اجباية
  Future<void> clear() async {}
}
