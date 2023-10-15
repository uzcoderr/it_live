import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/feature/register/data/models/status_model.dart';
import 'package:itlivetest/feature/register/data/repositories/register_repositroy_implementation.dart';
import 'package:itlivetest/feature/register/domain/repositories/register_repository.dart';

class GetStatusByGroupIdUseCase extends UseCase<List<StatusModel>,int>{

  final RegisterRepository _repository = RegisterRepositoryImplementation();

  @override
  Future<Either<Failure, List<StatusModel>>> call(int params) {
    return _repository.getStatusByGroupId(params);
  }

}