import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_bids_state.dart';

class MyBidsCubit extends Cubit<MyBidsState> {
  MyBidsCubit() : super(MyBidsInitial());

  bool soldForYou = false;
  List posts = [];
  List soldFor = [];

  Future<void> getBiddingPeople(String id) async {
    if (isClosed) return; // Check if the cubit is closed before proceeding
    emit(MyBidsUpdateLoading());
    try {
      var response = await FirebaseFirestore.instance
          .collection('Search')
          .doc("AllPosts")
          .collection("biddingPeople")
          .doc(id)
          .get();

      var biddingPeople = response.data()?['biddingPeople'] as List<dynamic>?;

      if (biddingPeople == null) {
        if (!isClosed) emit(MyBidsUpdateFailure("No bidding people found."));
        return;
      }

      List<Map<String, dynamic>> itemList =
          biddingPeople.map((e) => e as Map<String, dynamic>).toList();
      itemList.sort(
          (a, b) => int.parse(b['price']).compareTo(int.parse(a['price'])));
      soldForYou =
          FirebaseAuth.instance.currentUser!.email == itemList[0]['email'];
      soldFor.add(itemList[0]);
      if (!isClosed) emit(MyBidsUpdateSuccess(itemList));
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      if (!isClosed) emit(MyBidsUpdateFailure(e.toString()));
    }
  }

  Future<void> updateBiddingPeople() async {
    if (isClosed) return; // Check if the cubit is closed before proceeding
    emit(MyBidsLoading());
    try {
      var res = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      posts = res.data()!['userBidding'];
      if (!isClosed) emit(MyBidsSuccess());
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      if (!isClosed) emit(MyBidsFailure(e.toString()));
    }
  }
}
