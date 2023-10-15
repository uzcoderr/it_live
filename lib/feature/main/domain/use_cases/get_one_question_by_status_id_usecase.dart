import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/feature/main/data/models/question_model.dart';
import 'package:itlivetest/feature/main/data/repositories/main_repository_implementation.dart';
import 'package:itlivetest/feature/main/domain/repositories/main_repository.dart';

class GetOneQuestionByStatusIdUseCase extends UseCase<QuestionModel,int>{

  final MainRepository _repository = MainRepositoryImplementation();

  @override
  Future<Either<Failure, QuestionModel>> call(int params) {
    return _repository.getQuestionByStatusId(params);
  }

}