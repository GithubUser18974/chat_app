import 'package:chat_app/pages/login_cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure('User Not Found !'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailure('Wrong Password !'));
      }
    } catch (ex) {
      print(ex);
      emit(LoginFailure('Something Went Wrong !'));
    }
  }
}
