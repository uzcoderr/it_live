/// name : "string"
/// surname : "string"
/// email : "string"
/// group : 0
/// status : 0
/// password : "string"

class RegisterUser {
  RegisterUser({
      String? name, 
      String? surname, 
      String? email, 
      int? group,
      int? status,
      String? password,}){
    _name = name;
    _surname = surname;
    _email = email;
    _group = group;
    _status = status;
    _password = password;
}

  RegisterUser.fromJson(dynamic json) {
    _name = json['name'];
    _surname = json['surname'];
    _email = json['email'];
    _group = json['group'];
    _status = json['status'];
    _password = json['password'];
  }
  String? _name;
  String? _surname;
  String? _email;
  int? _group;
  int? _status;
  String? _password;
RegisterUser copyWith({  String? name,
  String? surname,
  String? email,
  int? group,
  int? status,
  String? password,
}) => RegisterUser(  name: name ?? _name,
  surname: surname ?? _surname,
  email: email ?? _email,
  group: group ?? _group,
  status: status ?? _status,
  password: password ?? _password,
);
  String? get name => _name;
  String? get surname => _surname;
  String? get email => _email;
  int? get group => _group;
  int? get status => _status;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['surname'] = _surname;
    map['email'] = _email;
    map['group'] = _group;
    map['status'] = _status;
    map['password'] = _password;
    return map;
  }

}