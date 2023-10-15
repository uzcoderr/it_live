import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/feature/main/data/models/rating_model.dart';
import 'package:itlivetest/feature/main/data/repositories/main_repository_implementation.dart';
import 'package:itlivetest/feature/main/domain/repositories/main_repository.dart';
import 'package:itlivetest/feature/main/domain/use_cases/get_interview_quesrion_by_language_id_usecase.dart';

class GetUsersRatingUseCase extends UseCase<List<RatingModel>,ThreeObj>{

  final MainRepository _repository = MainRepositoryImplementation();

  @override
  Future<Either<Failure, List<RatingModel>>> call(ThreeObj params) {
    return _repository.getUsersRating(params);
  }

}