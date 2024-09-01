part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String errMessage;

  const LoginFailure(this.errMessage);
}

class LoginSuccess extends LoginState {
  final LoginModel info;

  const LoginSuccess(this.info);
}
