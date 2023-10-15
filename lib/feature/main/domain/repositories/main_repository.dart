 import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/main/data/models/interview_question_model.dart';
import 'package:itlivetest/feature/main/data/models/programming_language_model.dart';
import 'package:itlivetest/feature/main/data/models/question_model.dart';
import 'package:itlivetest/feature/main/data/models/rating_model.dart';
import 'package:itlivetest/feature/main/data/models/status_model.dart';
import 'package:itlivetest/feature/main/data/models/update_user_data.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_interview_quesrion_by_language_id_usecase.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';

abstract class MainRepository{
  Future<Either<Failure,UserInformation>> getUserInformation();
  Future<Either<Failure,RegisterRes>> updateUserInformation(UpdateUserData userData);
  Future<Either<Failure,List<QuestionModel>>> getAllQuestionsByStatusId(int statusId);
  Future<Either<Failure,QuestionModel>> getQuestionByStatusId(int statusId);
  Future<Either<Failure,RegisterRes>> addUserData(TwoObj obj);
  Future<Either<Failure,List<ProgrammingLanguageModel>>> getAllLanguages();
  Future<Either<Failure,List<InterviewQuestionModel>>> getInterViewQuestionByLanguageId(int languageId,int page,int size);
  Future<Either<Failure,void>> setIsFinished();
  Future<Either<Failure,List<RatingModel>>> getUsersRating(ThreeObj obj);
}