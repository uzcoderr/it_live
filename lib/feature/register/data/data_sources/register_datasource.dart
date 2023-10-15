import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/singletons/dio_settings.dart';
import 'package:itlivetest/core/singletons/service_locator.dart';
import 'package:itlivetest/core/singletons/storage/storage.dart';
import 'package:itlivetest/core/singletons/storage/storage_keys.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/register/data/models/group.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';
import 'package:itlivetest/feature/register/data/models/register_user.dart';
import 'package:itlivetest/core/exceptions/exceptions.dart';
import 'package:itlivetest/feature/register/data/models/status_model.dart';

abstract class RegisterDatasource{
  Future<RegisterRes> registerUser(RegisterUser user);
  Future<List<Group>> getAllGroups();
  Future<List<StatusModel>> getStatusByGroupId(int id);
  Future<RegisterRes> emailVerify(TwoObj<String, int> obj);
}

class RegisterDatasourceImplementation extends RegisterDatasource{

  final dio = serviceLocator<DioSettings>().dio;
  final token = StorageRepository.getString(StoreKeys.token);

  @override
  Future<RegisterRes> registerUser(RegisterUser user) async{
    try {
      final response = await dio.post(
        '/api/v1/auth/register',
        data: user.toJson()
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return RegisterRes.fromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<RegisterRes> emailVerify(TwoObj<String, int> obj) async{
    try {
      final response = await dio.get(
        '/api/v1/auth/verifyEmail?email=${obj.a}&emailCode=${obj.b}',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return RegisterRes.fromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<Group>> getAllGroups() async{
    try {
      final response = await dio.get(
          '/api/v1/group/getAllGroups',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Group.fromListJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<StatusModel>> getStatusByGroupId(int id) async{
    try {
      final response = await dio.get(
          '/api/v1/status/getAllStatusByGroupId/$id',
          // options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return StatusModel.fromListJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }



}