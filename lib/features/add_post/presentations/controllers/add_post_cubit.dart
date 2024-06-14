import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:meta/meta.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());

  List<String> postImages = [];

  Future<void> addPost(
      final List<File> images,
      final String caption,
      final String classification,
      final String location,
      final String price,
      final String date) async {
    firebase_storage.Reference ref;
    emit(AddPostLoading());

    try {
      for (var i = 0; i < images.length; i++) {
        ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('postImages/${DateTime.now().millisecondsSinceEpoch}_$i');

        await ref.putFile(images[i]).whenComplete(() async {
          print('Upload done for image $i');
          String downloadURL = await ref.getDownloadURL();
          postImages.add(downloadURL);
        });
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .update({
        "posts": FieldValue.arrayUnion([
          {
            'images': postImages,
            'desc': caption,
            'classification': classification,
            'location': location,
            'price': price,
            'date': date,
          }
        ]),
      });

      await FirebaseFirestore.instance
          .collection('classification')
          .doc(classification)
          .collection("${classification}Posts")
          .doc("${classification}Posts")
          .update({
        "posts": FieldValue.arrayUnion([
          {
            'images': postImages,
            'desc': caption,
            'classification': classification,
            'location': location,
            'price': price,
            'date': date,
          }
        ]),
      });

      emit(AddPostSuccess('Post added successfully.'));
    } catch (e) {
      print('Error: $e');
      emit(AddPostFailure(e.toString()));
    }
  }
}
