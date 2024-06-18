
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bidding_now_state.dart';

class BiddingNowCubit extends Cubit<BiddingNowState> {
  BiddingNowCubit() : super(BiddingNowInitial());

  Future<void> getBiddingPeople(final String id) async {
    emit(BiddingNowLoading());

    try {
      var response = await FirebaseFirestore.instance
          .collection('Search')
          .doc("AllPosts")
          .collection("biddingPeople")
          .doc(id)
          .get();

      // Assuming biddingPeople is already a list of maps
      var biddingPeople = response.data()?['biddingPeople'] as List<dynamic>?;

      if (biddingPeople == null) {
        emit(BiddingNowFailure("No bidding people found."));
        return;
      }

      // Ensure each item is a Map<String, dynamic>
      List<Map<String, dynamic>> itemList = biddingPeople.map((e) => e as Map<String, dynamic>).toList();

      // Sort the list by price in descending order
      itemList.sort((a, b) => int.parse(b['price']).compareTo(int.parse(a['price'])));

      emit(BiddingNowSuccess(itemList));
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(BiddingNowFailure(e.toString()));
    }
  }

  Future<void> updateBiddingPeople(final String price, final String id,Map data) async {
    emit(BiddingNowUpdateLoading());

    try {
      await FirebaseFirestore.instance
          .collection('Search')
          .doc("AllPosts")
          .collection("biddingPeople")
          .doc(id)
          .update({
        "biddingPeople": FieldValue.arrayUnion([
          {
            "email": FirebaseAuth.instance.currentUser!.email.toString(),
            "price": price,
          }
        ]),
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .update({
        "userBidding": FieldValue.arrayUnion([
          data
        ]),
      });
      emit(BiddingNowUpdateSuccess());
      await getBiddingPeople(id); // Ensure the data is fetched and state updated after the update
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(BiddingNowUpdateFailure(e.toString()));
    }
  }
}
