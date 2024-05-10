import 'package:bidding_house/core/utils/imports.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key, this.onPressedLogin, this.onPressedSignUp,
  });
final void Function()? onPressedLogin;
final void Function()? onPressedSignUp;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            height: 42.h(context),
            color: Colors.transparent,
            onPressed: onPressedSignUp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.w(context)),
              side: const BorderSide(color: Color(0xFF2E2E2F)),
            ),
            child: Text(
              "Sign up",
              style: AppTextStyles.style16_400(
                  context, CustomColor.white),
            ),
          ),
        ),
        SizedBoxApp(w: 20.w(context)),
        Expanded(
          child: MaterialButton(
            height: 42.h(context),
            color: Colors.green,
            onPressed: onPressedLogin,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.w(context)),
            ),
            child: Text(
              "Log in",
              style: AppTextStyles.style16_400(
                  context, CustomColor.white),
            ),
          ),
        ),
      ],
    );
  }
}
