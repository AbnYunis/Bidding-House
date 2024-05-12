import 'package:bidding_house/core/utils/imports.dart';
class CategoryAppBar extends StatelessWidget {
  final String title;
  const CategoryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_circle_left_outlined,color: Colors.white,),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        SizedBoxApp(
          w: 90.w(context),
        ),
        Text(
          title,
          style: AppTextStyles.style20_800(context, CustomColor.white),
        ),
      ],
    );
  }
}
