import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bidding_now_state.dart';

class BiddingNowCubit extends Cubit<BiddingNowState> {
  BiddingNowCubit() : super(BiddingNowInitial());

  Future<void> getBiddingPeople(
    final String id,
  ) async {
    emit(BiddingNowLoading());

    try {
      var response = await FirebaseFirestore.instance
          .collection('Search')
          .doc("AllPosts")
          .collection("biddingPeople")
          .doc(id)
          .get();

      emit(BiddingNowSuccess(response.data()!['biddingPeople']));
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(BiddingNowFailure(e.toString()));
    }
  }

  Future<void> updateBiddingPeople(
    final String price,
    final String id,
  ) async {
    emit(BiddingNowUpdateLoading());

    try {
       await FirebaseFirestore.instance
          .collection('Search')
          .doc("AllPosts")
          .collection("biddingPeople")
          .doc(id)
          .update({
        "biddingPeople": FieldValue.arrayUnion([{
          "email": FirebaseAuth.instance.currentUser!.email.toString(),
          "price":price,
        }]),
      });

      emit(BiddingNowUpdateSuccess());
      getBiddingPeople(id);
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(BiddingNowUpdateFailure(e.toString()));
    }
  }
}
