import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/usecase/usecase.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/feature/register/data/models/group.dart';
import 'package:itlivetest/feature/register/data/repositories/register_repositroy_implementation.dart';
import 'package:itlivetest/feature/register/domain/repositories/register_repository.dart';

class GetAllGroupsUseCase extends UseCase<List<Group>,void>{

  final RegisterRepository _repository = RegisterRepositoryImplementation();

  @override
  Future<Either<Failure, List<Group>>> call(void params) {
    return _repository.getAllGroups();
  }

}