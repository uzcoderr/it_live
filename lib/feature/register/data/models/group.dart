/// id : 3
/// createdAt : "2023-10-06T22:06:53.000+00:00"
/// updatedAt : "2023-10-06T22:06:52.000+00:00"
/// name : "BACK END"

class Group {
  Group({
      num? id, 
      String? createdAt, 
      String? updatedAt, 
      String? name,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _name = name;
}

  Group.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _name = json['name'];
  }

  static List<Group> fromListJson(dynamic response){
    List<Group> res = [];
    response.forEach((v){
      res.add(Group.fromJson(v));
    });
    return res;
  }

  num? _id;
  String? _createdAt;
  String? _updatedAt;
  String? _name;
Group copyWith({  num? id,
  String? createdAt,
  String? updatedAt,
  String? name,
}) => Group(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  name: name ?? _name,
);
  num? get id => _id;
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