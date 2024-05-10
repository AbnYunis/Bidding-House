import 'package:bidding_house/core/utils/imports.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Forgot your password?",
          style:
          AppTextStyles.style14_400(context, CustomColor.white),
        ),
        Text(
          " Recover here.",
          style: AppTextStyles.style14_400(context, CustomColor.blue),
        ),
      ],
    );
  }
}
