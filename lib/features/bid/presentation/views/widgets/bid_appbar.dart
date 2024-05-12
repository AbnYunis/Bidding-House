import 'package:bidding_house/core/utils/imports.dart';
class BidDetailsAppBar extends StatelessWidget {
  const BidDetailsAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_circle_left_outlined,color: Colors.blue,),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        SizedBoxApp(
          w: 90.w(context),
        ),
        Text(
          "Details",
          style: AppTextStyles.style20_800(context, CustomColor.blue),
        ),
      ],
    );
  }
}
