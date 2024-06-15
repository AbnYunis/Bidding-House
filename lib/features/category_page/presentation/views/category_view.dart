import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/category_page/presentation/controllers/bids_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  final String title;

  const CategoryView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPostCubit()..getPosts(title),
      child: SafeArea(
        child: Scaffold(
          body: CategoryBody(
            title: title,
          ),
        ),
      ),
    );
  }
}
