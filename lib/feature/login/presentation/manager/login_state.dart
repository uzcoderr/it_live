part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {

  final FormzSubmissionStatus status;

  const LoginState( {this.status = FormzSubmissionStatus.initial});

  LoginState copyWith({FormzSubmissionStatus? status})=>LoginState(status: status ?? this.status);

  @override
  List<Object?> get props => [];

}
