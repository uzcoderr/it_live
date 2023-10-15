import 'package:equatable/equatable.dart';
import 'package:itlivetest/core/exceptions/feilure.dart';
import 'package:itlivetest/core/utils/eighter.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
