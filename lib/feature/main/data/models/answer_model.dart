/// isCorrect : true
/// value : "string"
/// questionId : 0

class AnswerModel {
  AnswerModel({
      int? answerId = -1,
      bool? isCorrect = false,
      String? value = '...',
      int? questionId = -1,}){
    _isCorrect = isCorrect;
    _value = value;
    _questionId = questionId;
}

  AnswerModel.fromJson(dynamic json) {
    _isCorrect = json['isCorrect'];
    _answerId = json['answerId'];
    _value = json['value'];
    _questionId = json['questionId'];
  }

  static List<AnswerModel> listFromJson(dynamic response){
    List<AnswerModel> res = [];
    if(response!=null){
      response.forEach((v){
        res.add(AnswerModel.fromJson(v));
      });
    }
    return res;
  }

  bool? _isCorrect;
  String? _value;
  int? _questionId;
  int? _answerId;
AnswerModel copyWith({  bool? isCorrect,
  String? value,
  int? questionId,
  int? answerId,
}) => AnswerModel(  isCorrect: isCorrect ?? _isCorrect,
  value: value ?? _value,
  answerId: answerId ?? _answerId,
  questionId: questionId ?? _questionId,
);
  bool? get isCorrect => _isCorrect;
  String? get value => _value;
  int? get questionId => _questionId;
  int? get answerId => _answerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isCorrect'] = _isCorrect;
    map['value'] = _value;
    map['questionId'] = _questionId;
    map['answerId'] = _answerId;
    return map;
  }

}