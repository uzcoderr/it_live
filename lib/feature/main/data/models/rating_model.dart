/// name : "string"
/// surname : "string"
/// status : {"id":0,"name":"string","timeExpired":"string","groupId":0}
/// ball : 0

class RatingModel {
  RatingModel({
      String? name, 
      String? surname, 
      Status? status, 
      int? ball,}){
    _name = name;
    _surname = surname;
    _status = status;
    _ball = ball;
}

  RatingModel.fromJson(dynamic json) {
    _name = json['name'];
    _surname = json['surname'];
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _ball = json['ball'];
  }

  static List<RatingModel> listFromJson(dynamic response){
    List<RatingModel> res = [];
    if(response!=null){
      response.forEach((v){
        res.add(RatingModel.fromJson(v));
      });
    }
    return res;
  }

  String? _name;
  String? _surname;
  Status? _status;
  int? _ball;
RatingModel copyWith({  String? name,
  String? surname,
  Status? status,
  int? ball,
}) => RatingModel(  name: name ?? _name,
  surname: surname ?? _surname,
  status: status ?? _status,
  ball: ball ?? _ball,
);
  String? get name => _name;
  String? get surname => _surname;
  Status? get status => _status;
  int? get ball => _ball;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['surname'] = _surname;
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    map['ball'] = _ball;
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