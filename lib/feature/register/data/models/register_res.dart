/// message : "string"
/// isSuccess : true
/// object : {}
/// status : 0

class RegisterRes {
  RegisterRes({
      String? message, 
      bool? isSuccess, 
      dynamic object,
      num? status,}){
    _message = message;
    _isSuccess = isSuccess;
    _object = object;
    _status = status;
}

  RegisterRes.fromJson(dynamic json) {
    _message = json['message'];
    _isSuccess = json['isSuccess'];
    _object = json['object'];
    _status = json['status'];
  }
  String? _message;
  bool? _isSuccess;
  dynamic _object;
  num? _status;
RegisterRes copyWith({  String? message,
  bool? isSuccess,
  dynamic object,
  num? status,
}) => RegisterRes(  message: message ?? _message,
  isSuccess: isSuccess ?? _isSuccess,
  object: object ?? _object,
  status: status ?? _status,
);
  String? get message => _message;
  bool? get isSuccess => _isSuccess;
  dynamic get object => _object;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['isSuccess'] = _isSuccess;
    map['object'] = _object;
    map['status'] = _status;
    return map;
  }

}