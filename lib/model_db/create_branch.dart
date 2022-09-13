class Bbranch {
  late int id;
  late String name;

  static const String tableName = 'admin';

  Bbranch();

  Bbranch.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map['name'] = name;

    return map;
  }
}
