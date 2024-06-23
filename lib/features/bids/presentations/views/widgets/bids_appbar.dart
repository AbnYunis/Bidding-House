import 'package:bidding_house/core/utils/imports.dart';
class BidsAppBar extends StatelessWidget {
  const BidsAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "My Bids",
          style: AppTextStyles.style20_800(context, CustomColor.white),
        ),
      ],
    );
  }
}
