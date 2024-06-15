import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/category_page/presentation/controllers/bids_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBody extends StatelessWidget {
  final String title;

  const CategoryBody({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryAppBar(
          title: title,
        ),
        Expanded(
          child: BlocConsumer<GetPostCubit, GetPostState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              if(state is GetPostSuccess){
                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) =>  CustomCategoryItem(data: state.posts[index],),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );

            },
          ),
        ),
      ],
    );
  }
}
