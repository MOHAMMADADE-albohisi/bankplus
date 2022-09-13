class Services {
  late int id;
  late String typeName;
  late int amount;
  late String info;
  late String state;
  late String infoLoan;
  late String document;
  late String date;
  late String user_name;

  static const String tableName = 'services';

  Services();

  Services.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    typeName = rowMap['typeName'];
    amount = rowMap['amount'];
    info = rowMap['info'];
    state = rowMap['state'];
    infoLoan = rowMap['infoLoan'];
    document = rowMap['document'];
    date = rowMap['date'];
    user_name = rowMap['user_name'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['typeName'] = typeName;
    map['amount'] = amount;
    map['info'] = info;
    map['state'] = state;
    map['infoLoan'] = infoLoan;
    map['document'] = document;
    map['date'] = date;
    map['user_name'] = user_name;

    return map;
  }
}
