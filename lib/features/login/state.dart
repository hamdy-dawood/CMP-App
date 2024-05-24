part of 'cubit.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState({required this.loginModel});
}

class LoginFailureState extends LoginState {
  final String stateMsg;

   LoginFailureState({required this.stateMsg});
}

class VisibilityChangeState extends LoginState {}
