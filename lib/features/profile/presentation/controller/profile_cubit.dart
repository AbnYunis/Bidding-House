import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  bool login = true;

  void changeLogin() {
    login = !login;
    emit(ProfileInitial());
  }

  Future<void> getProfile({String? id}) async {
    try {
      emit(ProfileLoading());

      var res = await FirebaseFirestore.instance
          .collection('users')
          .doc(id ?? FirebaseAuth.instance.currentUser!.uid)
          .get();
      emit(ProfileSuccess(res));
    } catch (e) {
      emit(
          ProfileFailure('Opps! , There is an error, please try again later.'));
    }
  }
}
