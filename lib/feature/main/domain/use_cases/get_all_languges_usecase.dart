import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/feature/main/data/models/programming_language_model.dart';
import 'package:itlivetest/feature/main/data/repositories/main_repository_implementation.dart';
import 'package:itlivetest/feature/main/domain/repositories/main_repository.dart';

class GetAllLanguagesUseCase extends UseCase<List<ProgrammingLanguageModel>,int>{

  final MainRepository _repository = MainRepositoryImplementation();

  @override
  Future<Either<Failure, List<ProgrammingLanguageModel>>> call(int params) {
    return _repository.getAllLanguages();
  }

}