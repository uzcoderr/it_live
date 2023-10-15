import 'package:dio/dio.dart';

class CustomInterceptor implements Interceptor {
  final Dio dio;
  CustomInterceptor({required this.dio});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }
}