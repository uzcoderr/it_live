import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/feature/main/data/models/user_information.dart';
import 'package:itlivetest/feature/main/data/repositories/main_repository_implementation.dart';
import 'package:itlivetest/feature/main/domain/repositories/main_repository.dart';

class UserInformationUseCase extends UseCase<UserInformation,void>{
  final MainRepository _repository = MainRepositoryImplementation();
  @override
  Future<Either<Failure, UserInformation>> call(void params) {
    return _repository.getUserInformation();
  }
}