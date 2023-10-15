import 'package:dio/dio.dart';
import 'package:itlivetest/core/exceptions/exceptions.dart';
import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/singletons/dio_settings.dart';
import 'package:itlivetest/core/singletons/service_locator.dart';
import 'package:itlivetest/core/singletons/storage/storage.dart';
import 'package:itlivetest/core/singletons/storage/storage_keys.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/main/data/models/interview_question_model.dart';
import 'package:itlivetest/feature/main/data/models/programming_language_model.dart';
import 'package:itlivetest/feature/main/data/models/question_model.dart';
import 'package:itlivetest/feature/main/data/models/rating_model.dart';
import 'package:itlivetest/feature/main/data/models/update_user_data.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_interview_quesrion_by_language_id_usecase.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';


abstract class MainDataSource {
  Future<UserInformation> getUserInformation();
  Future<RegisterRes> updateUserInformation(UpdateUserData userData);
  Future<List<QuestionModel>> getAllQuestionsByStatusId(int statusId);
  Future<QuestionModel> getQuestionByStatusId(int statusId);
  Future<RegisterRes> addUserData(TwoObj obj);
  Future<List<ProgrammingLanguageModel>> getAllLanguages();
  Future<List<InterviewQuestionModel>> getInterViewQuestionByLanguageId(int languageId,int page,int size);
  Future<void> setIsFinished();
  Future<List<RatingModel>> getUsersRating(ThreeObj obj);
}

class MainDataSourceImplementation extends MainDataSource{

  final dio = serviceLocator<DioSettings>().dio;
  final token = StorageRepository.getString(StoreKeys.token);

  @override
  Future<UserInformation> getUserInformation() async{
    try {
      final response = await dio.get(
          '/api/v1/user/getOwnInformation',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UserInformation.fromJson(response.data);
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
  Future<RegisterRes> updateUserInformation(UpdateUserData userData) async{
    try {
      final response = await dio.put(
        '/api/v1/user/updateOwnInformation',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: userData.toJson()
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return RegisterRes.fromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.data['message'] ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<QuestionModel>> getAllQuestionsByStatusId(int statusId) async{
    try {
      final response = await dio.get(
          '/api/v1/question/getQuest/getQuestionByStatus/$statusId',
          options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return QuestionModel.listFromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.data['message'] ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<QuestionModel> getQuestionByStatusId(int statusId) async{
    try {
      final response = await dio.get(
        '/api/v1/question/getQuest/getQuestion/$statusId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return QuestionModel.fromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.data['message'] ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<RegisterRes> addUserData(TwoObj<dynamic, dynamic> obj) async{
    try {
      final response = await dio.post(
        '/api/v1/userdata/addUserData',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: {
          "questionId": obj.a,
          "chosenAnswerId":obj.b
        }
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return RegisterRes.fromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.data['message'] ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<ProgrammingLanguageModel>> getAllLanguages() async{
    try {
      final response = await dio.get(
        '/api/v1/language/getAllLanguage',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ProgrammingLanguageModel.listFromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.data['message'] ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<InterviewQuestionModel>> getInterViewQuestionByLanguageId(int languageId,int page,int size) async{
    try {
      final response = await dio.get(
        '/api/v1/interviewQuestion/getInterviewQuestionPageByLanguageId/$languageId?page=$page&size=$size',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return InterviewQuestionModel.listFromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.data['message'] ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> setIsFinished() async{
    try {
      final response = await dio.put(
        '/api/v1/user/setIsFinished',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        // return 1;
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.data['message'] ?? '');
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<RatingModel>> getUsersRating(ThreeObj obj) async{
    try {
      final response = await dio.get(
        '/api/v1/userdata/userRating/${obj.a}?page=${obj.b}&size=${obj.c}',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return RatingModel.listFromJson(response.data);
      }
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