import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/login/data/repositories/login_repository_imokementation.dart';
import 'package:itlivetest/feature/login/domain/repositories/login_repository.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';

class LoginUseCase extends UseCase<RegisterRes,TwoObj>{
  final LoginRepository _repository = LoginRepositoryImplementation();
  @override
  Future<Either<Failure, RegisterRes>> call(TwoObj params) {
    return _repository.login(params);
  }
}