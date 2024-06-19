import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/add_post/presentations/controllers/add_post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key, required this.image});

  final List<File> image;

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  @override
  void initState() {
    requestMicrophonePermission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPostCubit>(
      create: (context) => AddPostCubit(),
      child: SafeArea(child: Scaffold(
        body: AddPostBody(file: widget.image,),
      ),),
    );
  }

  Future<void> requestMicrophonePermission() async {
    var status = await Permission.location.request();
    if (status.isDenied) {
      // Handle denied permission
    }
  }
}
