import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool login = true;

  void changeLogin() {
    login = !login;
    emit(AuthInitial());
  }

  Future<void> signUp(
      final String email, final String password, final String userName) async {
    try {
      emit(AuthLoading());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'username': userName,
        'email': email,
      });
      emit(AuthSuccess('Account created successfully'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailure('The account already exists for that email.'));
      }
    } catch (e) {
      emit(AuthFailure('Opps! , There is an error, please try again later.'));
    }
  }

  Future<void> logIn(final String email, final String password) async {
    try {
      emit(AuthLoading());
     await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess('Login Success'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure('Wrong password provided for that user.'));
      }
    }
  }
}
