import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/add_post/presentations/controllers/add_post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key, required this.image});

  final List<File> image;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPostCubit>(
      create: (context) => AddPostCubit(),
      child: SafeArea(child: Scaffold(
        body: AddPostBody(file: image,),
      ),),
    );
  }
}
