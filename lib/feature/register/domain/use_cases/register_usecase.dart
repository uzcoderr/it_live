import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';
import 'package:itlivetest/feature/register/data/models/register_user.dart';
import 'package:itlivetest/feature/register/data/repositories/register_repositroy_implementation.dart';
import 'package:itlivetest/feature/register/domain/repositories/register_repository.dart';

class RegisterUserUseCase extends UseCase<RegisterRes,RegisterUser>{

  final RegisterRepository _repository = RegisterRepositoryImplementation();

  @override
  Future<Either<Failure, RegisterRes>> call(RegisterUser params) {
    return _repository.registerUser(params);
  }

}