part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterUserEvent extends RegisterEvent{
  final RegisterUser user;
  final Function loading;
  final Function(Failure) error;
  final Function(String email) success;
  RegisterUserEvent({required this.user,required this.loading,required this.error,required this.success});
}

class VerifyUserEmailEvent extends RegisterEvent{
  final TwoObj<String, int> obj;
  final Function loading;
  final Function(Failure) error;
  final Function() success;
  VerifyUserEmailEvent({required this.obj,required this.success,required this.loading,required this.error});
}

class GetAllGroupsEvent extends RegisterEvent{
  final Function loading;
  final Function(Failure) error;
  final Function(List<Group>) success;
  GetAllGroupsEvent({required this.success,required this.error,required this.loading});
}

class GetStatusByGroupIdEvent extends RegisterEvent{
  final int id;
  final Function loading;
  final Function(Failure) error;
  final Function(List<StatusModel>) success;
  GetStatusByGroupIdEvent({required this.success,required this.error,required this.loading,required this.id});
}
