import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool login = true;
  List<String> postImages = [];

  void changeLogin() {
    login = !login;
    emit(AuthInitial());
  }

  Future<void> upLoadImage(final List<File> images) async {
    try {
      firebase_storage.Reference ref;

      emit(UploadImageLoading());
      for (var i = 0; i < images.length; i++) {
        ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('postImages/${DateTime.now().millisecondsSinceEpoch}_$i');

        await ref.putFile(images[i]).whenComplete(() async {
          if (kDebugMode) {
            print('Upload done for image $i');
          }
          String downloadURL = await ref.getDownloadURL();
          postImages.add(downloadURL);
        });
      }
      emit(UploadImageSuccess());
    } catch (e) {
      emit(UploadImageFailure('Opps! , There is an error, please try again later.'));
    }
  }

  Future<void> signUp(
    final String email,
    final String password,
    final String userName,
  ) async {
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
        'posts': [],
        'userBidding': [],
        'username': userName,
        'profileImages': postImages,
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

      emit(
        AuthFailure(
            'Something went wrong, please check your email and password.'),
      );
    }
  }
}
