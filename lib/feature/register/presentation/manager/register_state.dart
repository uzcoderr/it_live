part of 'register_bloc.dart';

@immutable
class RegisterState extends Equatable {

  final FormzSubmissionStatus status;
  final String email;

  const RegisterState({
    this.status = FormzSubmissionStatus.initial,
    this.email = ""
  });

  RegisterState copyWith({FormzSubmissionStatus? status,String? email,Failure? failure})=>RegisterState(status: status ?? this.status,email: email??this.email);

  @override
  List<Object> get props => [status,email];
}
