abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  String errMessage;
  LoginFailure(this.errMessage);
}

class LoginLoading extends LoginState {}
