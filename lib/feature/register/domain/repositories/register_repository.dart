import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/feature/register/data/models/group.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';
import 'package:itlivetest/feature/register/data/models/register_user.dart';
import 'package:itlivetest/feature/register/data/models/status_model.dart';

import '../../../../core/utils/modles/tow_model.dart';

abstract class RegisterRepository{
  Future<Either<Failure,RegisterRes>> registerUser(RegisterUser user);
  Future<Either<Failure,List<Group>>> getAllGroups();
  Future<Either<Failure,List<StatusModel>>> getStatusByGroupId(int id);
  Future<Either<Failure,RegisterRes>> emailVerify(TwoObj<String, int> obj);
}
