import 'package:itlivetest/core/exceptions/exceptions.dart';
import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/main/data/data_sources/main_datasource.dart';
import 'package:itlivetest/feature/main/data/models/interview_question_model.dart';
import 'package:itlivetest/feature/main/data/models/programming_language_model.dart';
import 'package:itlivetest/feature/main/data/models/question_model.dart';
import 'package:itlivetest/feature/main/data/models/rating_model.dart';
import 'package:itlivetest/feature/main/data/models/status_model.dart';
import 'package:itlivetest/feature/main/data/models/update_user_data.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/domain/repositories/main_repository.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_interview_quesrion_by_language_id_usecase.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';

class MainRepositoryImplementation extends MainRepository{

  MainDataSource dataSource = MainDataSourceImplementation();

  @override
  Future<Either<Failure,UserInformation>> getUserInformation() async{
    try {
      final result = await dataSource.getUserInformation();
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
  Future<Either<Failure, RegisterRes>> updateUserInformation(UpdateUserData userData) async{
    try {
      final result = await dataSource.updateUserInformation(userData);
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
  Future<Either<Failure, RegisterRes>> addUserData(TwoObj<dynamic, dynamic> obj) async{
    try {
      final result = await dataSource.addUserData(obj);
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
  Future<Either<Failure, List<QuestionModel>>> getAllQuestionsByStatusId(int statusId) async{
    try {
      final result = await dataSource.getAllQuestionsByStatusId(statusId);
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
  Future<Either<Failure, QuestionModel>> getQuestionByStatusId(int statusId) async{
    try {
      final result = await dataSource.getQuestionByStatusId(statusId);
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
  Future<Either<Failure, List<ProgrammingLanguageModel>>> getAllLanguages() async{
    try {
      final result = await dataSource.getAllLanguages();
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
  Future<Either<Failure, List<InterviewQuestionModel>>> getInterViewQuestionByLanguageId(int languageId, int page, int size) async{
    try {
      final result = await dataSource.getInterViewQuestionByLanguageId(languageId,page,size);
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
  Future<Either<Failure, void>> setIsFinished() async{
    try {
      final result = await dataSource.setIsFinished();
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
  Future<Either<Failure, List<RatingModel>>> getUsersRating(ThreeObj obj) async{
    try {
      final result = await dataSource.getUsersRating(obj);
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