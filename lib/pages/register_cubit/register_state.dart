abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  String errMessage;
  RegisterFailure(this.errMessage);
}

class RegisterLoading extends RegisterState {}
