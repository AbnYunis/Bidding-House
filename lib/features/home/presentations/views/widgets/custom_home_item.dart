import 'package:bidding_house/core/utils/imports.dart';


class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const MyImage(
          imageUrl:"https://picsum.photos/200/300"
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
