class Admin {
  late int id;
  late String name;
  late String email;
  late String password;
  late String branch;

 static const String tableName = 'admin';

  Admin();

  Admin.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    email = rowMap['email'];

    password = rowMap['password'];

    branch = rowMap['branch'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map['name'] = name;
    map['email'] = email;

    map['password'] = password;

    map['branch'] = branch;

    return map;
  }
}
