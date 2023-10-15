/// id : 0
/// createdAt : "2023-10-13T16:38:04.138Z"
/// updatedAt : "2023-10-13T16:38:04.138Z"
/// programmingLanguageName : "string"

class ProgrammingLanguageModel {
  ProgrammingLanguageModel({
      num? id, 
      String? createdAt, 
      String? updatedAt, 
      String? programmingLanguageName,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _programmingLanguageName = programmingLanguageName;
}

  ProgrammingLanguageModel.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _programmingLanguageName = json['programmingLanguageName'];
  }

  static List<ProgrammingLanguageModel> listFromJson(dynamic response){
    List<ProgrammingLanguageModel> res = [];
    if(response!=null){
      response.forEach((v){
        res.add(ProgrammingLanguageModel.fromJson(v));
      });
    }
    return res;
  }

  num? _id;
  String? _createdAt;
  String? _updatedAt;
  String? _programmingLanguageName;
ProgrammingLanguageModel copyWith({  num? id,
  String? createdAt,
  String? updatedAt,
  String? programmingLanguageName,
}) => ProgrammingLanguageModel(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  programmingLanguageName: programmingLanguageName ?? _programmingLanguageName,
);
  num? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get programmingLanguageName => _programmingLanguageName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['programmingLanguageName'] = _programmingLanguageName;
    return map;
  }

}