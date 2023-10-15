import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/main/data/repositories/main_repository_implementation.dart';
import 'package:itlivetest/feature/main/domain/repositories/main_repository.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';

class AddUserDataUseCase extends UseCase<RegisterRes,TwoObj>{

  final MainRepository _repository = MainRepositoryImplementation();

  @override
  Future<Either<Failure, RegisterRes>> call(TwoObj params) {
    return _repository.addUserData(params);
  }

}