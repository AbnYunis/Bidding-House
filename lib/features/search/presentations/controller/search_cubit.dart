import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  bool login = true;

  void changeLogin() {
    login = !login;
    emit(SearchInitial());
  }

  Future<void> getSearch(
     ) async {
    try {
      emit(SearchLoading());

      var res=await FirebaseFirestore.instance
          .collection('Search')
          .doc("AllPosts")
          .get();
      emit(SearchSuccess(res.data()!["posts"]));
    } catch (e) {
      emit(SearchFailure('Opps! , There is an error, please try again later.'));
    }
  }
}
