import 'package:bidding_house/core/utils/imports.dart';

class CategoryBody extends StatelessWidget {
  final String title;

  const CategoryBody({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final h = SizeApp(context).height;
    final w = SizeApp(context).width;

    return Column(
      children: [
        CategoryAppBar(
          title: title,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => const CustomCategoryItem(),
          ),
        ),
      ],
    );
  }
}
