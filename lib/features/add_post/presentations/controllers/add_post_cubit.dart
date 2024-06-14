import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:meta/meta.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());

  List<String> postImages = [];

  Future<void> addPost(
      final List images,
      final String caption,
      final String classification,
      final String location,
      final String price,
      final String date) async {
    firebase_storage.Reference ref;
    emit(AddPostLoading());
    for (var i in images) {
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('postImages/hello}');
      await ref.putFile(i).whenComplete(() async {
        print('done');
        await ref.getDownloadURL().then((val) {
          postImages.add(val);
        });
      });
    }
    print(postImages);
    emit(AddPostSuccess());
  }
}
