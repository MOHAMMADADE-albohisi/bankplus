class Admin {
  late int id;
  String email = 'mohammad@gmail.com';

  String password = '12345';

  static const String tableName = 'admin';

  Admin();

  Admin.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];

    email = rowMap['email'];

    password = rowMap['password'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map['email'] = email = 'mohammad@gmail.com';

    map['password'] = password = '12345';

    return map;
  }
}
