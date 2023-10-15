import 'package:itlivetest/core/exceptions/exceptions.dart';
import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/singletons/dio_settings.dart';
import 'package:itlivetest/core/singletons/service_locator.dart';
import 'package:itlivetest/core/singletons/storage/storage.dart';
import 'package:itlivetest/core/singletons/storage/storage_keys.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';

abstract class LoginDatasource {
  Future<RegisterRes> login(TwoObj obj);
}

class LoginDataSourceImplementation extends LoginDatasource{

  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<RegisterRes> login(TwoObj<dynamic, dynamic> obj) async{
    try {
      final response = await dio.get(
        '/api/v1/auth/login',
        data: {
          "email": obj.a,
          "password": obj.b
        }
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return RegisterRes.fromJson(response.data);
      }
      print('response.statusMessage');
      print(response.statusMessage);
      print(response.statusMessage);
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.data['message'] ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

}