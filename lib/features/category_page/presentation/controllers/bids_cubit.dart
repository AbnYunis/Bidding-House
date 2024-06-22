import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bids_state.dart';

class GetPostCubit extends Cubit<GetPostState> {
  GetPostCubit() : super(GetPostInitial());

  List<String> postImages = [];

  Future<void> getPosts(
    final String classification,
  ) async {
    emit(GetPostLoading());

    try {

      var response=await FirebaseFirestore.instance
          .collection('classification')
          .doc(classification).collection("${classification}Posts")
          .doc("${classification}Posts")
          .get();


      emit(GetPostSuccess(response.data()!['posts'].where((item) {
        DateTime itemDate = DateTime.parse(item['date']);
        return itemDate.isAfter( DateTime.now()) || itemDate.isAtSameMomentAs( DateTime.now());
      }).toList()));
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetPostFailure(e.toString()));
    }
  }
}
