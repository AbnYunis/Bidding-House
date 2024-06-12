import 'package:bidding_house/core/utils/imports.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:200.w(context) ,
      child: MaterialButton(
        height: 50.h(context),
        color: Colors.green,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w(context)),
          side: const BorderSide(color: Color(0xFF2E2E2F)),
        ),
        child: Text(
          text,
          style: AppTextStyles.style16_400(context, CustomColor.white),
        ),
      ),
    );
  }
}
