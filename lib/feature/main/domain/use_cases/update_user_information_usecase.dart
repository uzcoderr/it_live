import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/feature/main/data/models/update_user_data.dart';
import 'package:itlivetest/feature/main/data/repositories/main_repository_implementation.dart';
import 'package:itlivetest/feature/main/domain/repositories/main_repository.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';

class UpdateUserInformationUseCase extends UseCase<RegisterRes,UpdateUserData>{

  final MainRepository _repository = MainRepositoryImplementation();

  @override
  Future<Either<Failure, RegisterRes>> call(UpdateUserData params) {
    return _repository.updateUserInformation(params);
  }

}