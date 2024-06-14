import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/imports.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());

  Future<void> signOut() async {
    try {
      emit(SignOutLoading());
      await FirebaseAuth.instance.signOut();
      emit(SignOutSuccess('Successfully sign out'));
    } catch (e) {
      emit(SignOutFailure(
          'Opps! , There was an error ,please try again later.'));
    }
  }
  Future<void> getData() async {
    try {
      emit(HomeDataLoading());
      CollectionReference collectionReference=FirebaseFirestore.instance.collection("classification");
      var res =await collectionReference.get();
      emit(HomeDataSuccess(res));
    } catch (e) {
      emit(HomeDataFailure(
          'Opps! , There was an error ,please try again later.'));
    }
  }
}
