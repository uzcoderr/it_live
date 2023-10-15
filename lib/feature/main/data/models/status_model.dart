/// id : 1
/// name : "FRONT END(ABDULLA AKA)"
/// timeExpired : "10000"
/// groupId : 1

class StatusModel {
  StatusModel({
      int? id,
      String? name, 
      String? timeExpired, 
      int? groupId,}){
    _id = id;
    _name = name;
    _timeExpired = timeExpired;
    _groupId = groupId;
}

  StatusModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _timeExpired = json['timeExpired'];
    _groupId = json['groupId'];
  }
  int? _id;
  String? _name;
  String? _timeExpired;
  int? _groupId;
StatusModel copyWith({  int? id,
  String? name,
  String? timeExpired,
  int? groupId,
}) => StatusModel(  id: id ?? _id,
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