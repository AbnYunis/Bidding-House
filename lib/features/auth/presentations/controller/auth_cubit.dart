import 'dart:io';

import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/core/utils/shared_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool login = true;
  String profileImage = '';

  void changeLogin() {
    login = !login;
    emit(AuthInitial());
  }

  Future<void> signUp(
    final String email,
    final String password,
    final String userName,
    final File image,
  ) async {
    firebase_storage.Reference ref;
    emit(AuthLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('userImages/${DateTime.now().millisecondsSinceEpoch}_$image');

      await ref.putFile(image).whenComplete(() async {
        if (kDebugMode) {
          print('Upload done for image $image');
        }
        profileImage = await ref.getDownloadURL();
      });

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'posts': [],
        'userBidding': [],
        'username': userName,
        'profileImage': profileImage,
        'email': email,
      });
      SharedData.saveUserImage(userImage: profileImage);
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
      emit(
        AuthFailure(
            'Something went wrong, please check your email and password.'),
      );
    }
  }
}
