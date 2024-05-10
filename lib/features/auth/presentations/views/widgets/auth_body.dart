import 'package:bidding_house/core/utils/imports.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w(context)),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormWithName(
                  controller:emailController ,
                  text: "jimny@bonder.com",
                  textName: "Email",
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Enter email";
                    }
                    return null;
                  },
                ),
                SizedBoxApp(h: 33.h(context)),
                TextFormWithName(
                  controller:passController ,
                  text: "**************",
                  textName: "Password",
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Enter password";
                    }
                    return null;
                  },
                ),
                SizedBoxApp(h: 11.h(context)),
                const ForgetPass(),
                SizedBoxApp(h: 33.h(context)),
                AuthButton(
                  onPressedLogin: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  onPressedSignUp: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
                SizedBoxApp(h: 81.h(context)),
                const Logo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
