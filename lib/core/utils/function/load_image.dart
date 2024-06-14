import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
Future<List<File>> chooseImages(BuildContext context) async {
  List<File> imageFiles = [];
  await showDialog(
    context: context,
    builder: (context1) {
      return AlertDialog(
        title: const Text("Pick image from"),
        contentPadding: const EdgeInsets.all(10),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("Camera"),
              onTap: () {
                pickImage(ImageSource.camera).then((value) {
                  if (value != null) {
                    imageFiles.add(value);
                  }
                  Navigator.of(context).pop();
                });
              },
              trailing: Icon(
                Icons.camera_alt_outlined,
                color: Colors.red,
              ),
            ),
            ListTile(
              title: const Text("Gallery"),
              onTap: () {
                pickMultipleImagesFromGallery().then((values) {
                  if (values != null && values.isNotEmpty) {
                    imageFiles.addAll(values);
                  }
                  Navigator.of(context).pop();
                });
              },
              trailing: Icon(
                Icons.image,
                color: Colors.red,
              ),
            )
          ],
        ),
      );
    },
  );
  return imageFiles;
}

Future<File?> pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);

  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}

Future<List<File>> pickMultipleImagesFromGallery() async {
  List<File> imageFiles = [];
  final picker = ImagePicker();
  final pickedFiles = await picker.pickMultiImage();

  if (pickedFiles != null) {
    for (var pickedFile in pickedFiles) {
      imageFiles.add(File(pickedFile.path));
    }
  }

  return imageFiles;
}
