/// name : "string"
/// surname : "string"
/// oldPassword : "string"
/// password : "string"
/// statusId : 0
/// groupsId : 0

class UpdateUserData {
  UpdateUserData({
      String? name, 
      String? surname, 
      String? oldPassword, 
      String? password, 
      num? statusId, 
      num? groupsId,}){
    _name = name;
    _surname = surname;
    _oldPassword = oldPassword;
    _password = password;
    _statusId = statusId;
    _groupsId = groupsId;
}

  UpdateUserData.fromJson(dynamic json) {
    _name = json['name'];
    _surname = json['surname'];
    _oldPassword = json['oldPassword'];
    _password = json['password'];
    _statusId = json['statusId'];
    _groupsId = json['groupsId'];
  }
  String? _name;
  String? _surname;
  String? _oldPassword;
  String? _password;
  num? _statusId;
  num? _groupsId;
UpdateUserData copyWith({  String? name,
  String? surname,
  String? oldPassword,
  String? password,
  num? statusId,
  num? groupsId,
}) => UpdateUserData(  name: name ?? _name,
  surname: surname ?? _surname,
  oldPassword: oldPassword ?? _oldPassword,
  password: password ?? _password,
  statusId: statusId ?? _statusId,
  groupsId: groupsId ?? _groupsId,
);
  String? get name => _name;
  String? get surname => _surname;
  String? get oldPassword => _oldPassword;
  String? get password => _password;
  num? get statusId => _statusId;
  num? get groupsId => _groupsId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['surname'] = _surname;
    map['oldPassword'] = _oldPassword;
    map['password'] = _password;
    map['statusId'] = _statusId;
    map['groupsId'] = _groupsId;
    return map;
  }

}