/// id : 5
/// createdAt : "2023-10-07T00:17:37.000+00:00"
/// updatedAt : "2023-10-07T00:17:39.000+00:00"
/// questionCount : "AAAJAVOBI"
/// questionAnswer : "AAAA"
/// language : {"id":1,"createdAt":"2023-10-07T00:16:24.000+00:00","updatedAt":"2023-10-07T00:16:23.000+00:00","programmingLanguageName":"JAVA"}

class InterviewQuestionModel {
  InterviewQuestionModel({
      int? id,
      String? createdAt, 
      String? updatedAt, 
      String? questionCount, 
      String? questionAnswer, 
      Language? language,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _questionCount = questionCount;
    _questionAnswer = questionAnswer;
    _language = language;
}

  InterviewQuestionModel.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _questionCount = json['questionCount'];
    _questionAnswer = json['questionAnswer'];
    _language = json['language'] != null ? Language.fromJson(json['language']) : null;
  }

  static List<InterviewQuestionModel> listFromJson(dynamic response){
    List<InterviewQuestionModel> res = [];
    if(response!=null){
      response.forEach((v){
        res.add(InterviewQuestionModel.fromJson(v));
      });
    }
    return res;
  }

  int? _id;
  String? _createdAt;
  String? _updatedAt;
  String? _questionCount;
  String? _questionAnswer;
  Language? _language;
InterviewQuestionModel copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  String? questionCount,
  String? questionAnswer,
  Language? language,
}) => InterviewQuestionModel(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  questionCount: questionCount ?? _questionCount,
  questionAnswer: questionAnswer ?? _questionAnswer,
  language: language ?? _language,
);
  int? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get questionCount => _questionCount;
  String? get questionAnswer => _questionAnswer;
  Language? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['questionCount'] = _questionCount;
    map['questionAnswer'] = _questionAnswer;
    if (_language != null) {
      map['language'] = _language?.toJson();
    }
    return map;
  }

}

/// id : 1
/// createdAt : "2023-10-07T00:16:24.000+00:00"
/// updatedAt : "2023-10-07T00:16:23.000+00:00"
/// programmingLanguageName : "JAVA"

class Language {
  Language({
      int? id,
      String? createdAt, 
      String? updatedAt, 
      String? programmingLanguageName,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _programmingLanguageName = programmingLanguageName;
}

  Language.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _programmingLanguageName = json['programmingLanguageName'];
  }
  int? _id;
  String? _createdAt;
  String? _updatedAt;
  String? _programmingLanguageName;
Language copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  String? programmingLanguageName,
}) => Language(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  programmingLanguageName: programmingLanguageName ?? _programmingLanguageName,
);
  int? get id => _id;
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