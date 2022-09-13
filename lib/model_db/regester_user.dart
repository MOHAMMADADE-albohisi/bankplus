class User {
  late int id;
  late String identification;
  late String name;
  late String email;
  late String phoneNumber;
  late String password;
  late String accountNumber;
  late String gender;
  late String branch;

  static const String tableName = 'user';

  User();

  User.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    identification = rowMap['identification'];
    name = rowMap['name'];
    email = rowMap['email'];
    phoneNumber = rowMap['phoneNumber'];
    password = rowMap['password'];
    accountNumber = rowMap['accountNumber'];
    gender = rowMap['gender'];
    branch = rowMap['branch'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['identification'] = identification;
    map['name'] = name;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['accountNumber'] = accountNumber;
    map['gender'] = gender;
    map['branch'] = branch;
    return map;
  }
}
