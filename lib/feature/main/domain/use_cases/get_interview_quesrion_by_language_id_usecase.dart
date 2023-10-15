import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/feature/main/data/models/interview_question_model.dart';
import 'package:itlivetest/feature/main/data/repositories/main_repository_implementation.dart';
import 'package:itlivetest/feature/main/domain/repositories/main_repository.dart';

class GetInterViewQuestionByLanguageIdUseCase extends UseCase<List<InterviewQuestionModel>,ThreeObj>{

  final MainRepository _repository = MainRepositoryImplementation();

  @override
  Future<Either<Failure, List<InterviewQuestionModel>>> call(ThreeObj params) {
    return _repository.getInterViewQuestionByLanguageId(params.a,params.b,params.c);
  }

}
class ThreeObj{
  dynamic a;
  dynamic b;
  dynamic c;
  ThreeObj({required this.a,required this.b,required this.c});
}