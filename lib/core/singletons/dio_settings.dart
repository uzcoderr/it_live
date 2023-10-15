import 'package:dio/dio.dart';
import 'package:itlivetest/core/data/interprectors/custom_interprector.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

typedef ConverterFunctionType<T> = T Function(dynamic response);

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: 'http://64.226.120.51:8080',
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang, String? baseUrl}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: baseUrl ?? 'http://64.226.120.51:8080',
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 35000),
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio {
    final dio = Dio(_dioBaseOptions);
    dio.interceptors
      ..add(PrettyDioLogger(),);
    return dio;
  }
}
