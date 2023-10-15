/// name : "string"
/// surname : "string"
/// email : "string"
/// status : {"id":0,"name":"string","timeExpired":"string","groupId":0}
/// groups : {"id":0,"createdAt":"2023-10-11T17:44:11.130Z","updatedAt":"2023-10-11T17:44:11.130Z","name":"string"}
/// userBall : 0
/// isFinished : true

class UserInformation {
  UserInformation({
      String? name, 
      String? surname, 
      String? email, 
      Status? status, 
      Groups? groups, 
      int? userBall,
      bool? isFinished,}){
    _name = name;
    _surname = surname;
    _email = email;
    _status = status;
    _groups = groups;
    _userBall = userBall;
    _isFinished = isFinished;
}

  UserInformation.fromJson(dynamic json) {
    _name = json['name'];
    _surname = json['surname'];
    _email = json['email'];
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _groups = json['groups'] != null ? Groups.fromJson(json['groups']) : null;
    _userBall = json['userBall'];
    _isFinished = json['isFinished'];
  }
  String? _name;
  String? _surname;
  String? _email;
  Status? _status;
  Groups? _groups;
  int? _userBall;
  bool? _isFinished;
UserInformation copyWith({  String? name,
  String? surname,
  String? email,
  Status? status,
  Groups? groups,
  int? userBall,
  bool? isFinished,
}) => UserInformation(  name: name ?? _name,
  surname: surname ?? _surname,
  email: email ?? _email,
  status: status ?? _status,
  groups: groups ?? _groups,
  userBall: userBall ?? _userBall,
  isFinished: isFinished ?? _isFinished,
);
  String? get name => _name;
  String? get surname => _surname;
  String? get email => _email;
  Status? get status => _status;
  Groups? get groups => _groups;
  int? get userBall => _userBall;
  bool? get isFinished => _isFinished;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['surname'] = _surname;
    map['email'] = _email;
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    if (_groups != null) {
      map['groups'] = _groups?.toJson();
    }
    map['userBall'] = _userBall;
    map['isFinished'] = _isFinished;
    return map;
  }

}

/// id : 0
/// createdAt : "2023-10-11T17:44:11.130Z"
/// updatedAt : "2023-10-11T17:44:11.130Z"
/// name : "string"

class Groups {
  Groups({
      int? id,
      String? createdAt, 
      String? updatedAt, 
      String? name,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _name = name;
}

  Groups.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _name = json['name'];
  }
  int? _id;
  String? _createdAt;
  String? _updatedAt;
  String? _name;
Groups copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  String? name,
}) => Groups(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  name: name ?? _name,
);
  int? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['name'] = _name;
    return map;
  }

}

/// id : 0
/// name : "string"
/// timeExpired : "string"
/// groupId : 0

class Status {
  Status({
      int? id,
      String? name, 
      String? timeExpired, 
      int? groupId,}){
    _id = id;
    _name = name;
    _timeExpired = timeExpired;
    _groupId = groupId;
}

  Status.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _timeExpired = json['timeExpired'];
    _groupId = json['groupId'];
  }
  int? _id;
  String? _name;
  String? _timeExpired;
  int? _groupId;
Status copyWith({  int? id,
  String? name,
  String? timeExpired,
  int? groupId,
}) => Status(  id: id ?? _id,
  name: name ?? _name,
  timeExpired: timeExpired ?? _timeExpired,
  groupId: groupId ?? _groupId,
);
  int? get id => _id;
  String? get name => _name;
  String? get timeExpired => _timeExpired;
  int? get groupId => _groupId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['timeExpired'] = _timeExpired;
    map['groupId'] = _groupId;
    return map;
  }

}