import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List filteredResults = [];

  Future<void> getSearch(String value) async {
    try {
      emit(SearchLoading());
      var res = await FirebaseFirestore.instance
          .collection('Search')
          .doc('AllPosts')
          .get();
       filteredResults.clear();
      for (var doc in res.data()!['posts']) {
        if (doc['desc'].contains(value)) {
          filteredResults.add(doc);
        }
      }
      emit(SearchSuccess());
    } catch (e) {
      emit(SearchFailure('Opps! , There is an error, please try again later.'));
    }
  }
}
