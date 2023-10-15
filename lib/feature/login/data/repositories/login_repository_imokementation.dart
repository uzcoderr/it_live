import 'package:itlivetest/core/exceptions/exceptions.dart';
import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/login/data/data_sources/login_datasource.dart';
import 'package:itlivetest/feature/login/domain/repositories/login_repository.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';

class LoginRepositoryImplementation extends LoginRepository{

  LoginDatasource datasource = LoginDataSourceImplementation();

  @override
  Future<Either<Failure, RegisterRes>> login(TwoObj<dynamic, dynamic> obj) async{
    try {
      final result = await datasource.login(obj);
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