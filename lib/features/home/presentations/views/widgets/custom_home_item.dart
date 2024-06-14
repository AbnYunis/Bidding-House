import 'package:bidding_house/core/utils/imports.dart';


class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
         MyImage(
          imageUrl:image
        ),
        SizedBoxApp(h: 18.h(context)),
        Text(
          text,
          style: AppTextStyles.style16_800(context, CustomColor.white),
        ),
      ],
    );
  }
}
