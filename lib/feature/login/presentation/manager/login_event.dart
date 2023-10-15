part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class GetLoginEvent extends LoginEvent{
  final Function(Failure) onError;
  final Function loading;
  final Function(RegisterRes) success;
  final TwoObj obj;

  GetLoginEvent({required this.obj,required this.onError,required this.success,required this.loading});
}