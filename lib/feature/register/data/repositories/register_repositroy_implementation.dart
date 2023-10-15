import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/register/data/data_sources/register_datasource.dart';
import 'package:itlivetest/feature/register/data/models/group.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';
import 'package:itlivetest/feature/register/data/models/register_user.dart';
import 'package:itlivetest/feature/register/data/models/status_model.dart';
import 'package:itlivetest/feature/register/domain/repositories/register_repository.dart';
import 'package:itlivetest/core/exceptions/exceptions.dart';

class RegisterRepositoryImplementation extends RegisterRepository{

  RegisterDatasource datasource = RegisterDatasourceImplementation();

  @override
  Future<Either<Failure, RegisterRes>> registerUser(RegisterUser user) async{
    try {
      final result = await datasource.registerUser(user);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, RegisterRes>> emailVerify(TwoObj<String, int> obj) async{
    try {
      final result = await datasource.emailVerify(obj);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Group>>> getAllGroups() async{
    try {
      final result = await datasource.getAllGroups();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<StatusModel>>> getStatusByGroupId(int id) async{
    try {
      final result = await datasource.getStatusByGroupId(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }



}