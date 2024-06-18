import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auction_state.dart';

class AuctionCubit extends Cubit<AuctionState> {
  AuctionCubit() : super(AuctionInitial());

  Future<void> getAuction() async {
    try {
      emit(AuctionLoading());

      var res = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      emit(AuctionSuccess(res));
    } catch (e) {
      emit(
          AuctionFailure('Opps! , There is an error, please try again later.'));
    }
  }
}
