import 'package:cloud_firestore/cloud_firestore.dart';
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

      var response=await FirebaseFirestore.instance
          .collection('Search')
          .doc("AllPosts").collection("biddingPeople")
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
}
