import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/utils/eighter.dart';
import 'package:itlivetest/core/utils/modles/tow_model.dart';
import 'package:itlivetest/feature/register/data/models/register_res.dart';

abstract class LoginRepository{
  Future<Either<Failure,RegisterRes>> login(TwoObj obj);
}
