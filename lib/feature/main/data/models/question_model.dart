import 'package:itlivetest/feature/main/data/models/answer_model.dart';

import 'package:itlivetest/feature/main/data/models/answer_model.dart';

/// id : 19
/// savolBall : 10
/// testValue : "u"
/// title : "asdg"
/// statusId : 2
/// answers : null

class QuestionModel {
  QuestionModel({
      int? id,
      int? savolBall,
      String? testValue,
      String? title,
      int? statusId,
      List<AnswerModel> answers = const [],}){
    _id = id;
    _savolBall = savolBall;
    _testValue = testValue;
    _title = title;
    _statusId = statusId;
    _answers = answers;
}

  QuestionModel.fromJson(dynamic json) {
    _id = json['id'];
    _savolBall = json['savolBall'];
    _testValue = json['testValue'];
    _title = json['title'];
    _statusId = json['statusId'];
    _answers = AnswerModel.listFromJson(json['answers']);
  }

  static List<QuestionModel> listFromJson(dynamic response){
    List<QuestionModel> res = [];
    response.forEach((v){
      res.add(QuestionModel.fromJson(v));
    });
    return res;
  }

  int? _id;
  int? _savolBall;
  String? _testValue;
  String? _title;
  int? _statusId;
  List<AnswerModel> _answers = [];
QuestionModel copyWith({  int? id,
  int? savolBall,
  String? testValue,
  String? title,
  int? statusId,
  List<AnswerModel>? answers,
}) => QuestionModel(  id: id ?? _id,
  savolBall: savolBall ?? _savolBall,
  testValue: testValue ?? _testValue,
  title: title ?? _title,
  statusId: statusId ?? _statusId,
  answers: answers ?? _answers,
);
  int? get id => _id;
  int? get savolBall => _savolBall;
  String? get testValue => _testValue;
  String? get title => _title;
  int? get statusId => _statusId;
  List<AnswerModel>? get answers => _answers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['savolBall'] = _savolBall;
    map['testValue'] = _testValue;
    map['title'] = _title;
    map['statusId'] = _statusId;
    map['answers'] = _answers;
    return map;
  }
}

