import 'package:bidding_house/core/utils/function/load_image.dart';
import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/core/utils/widgets/custom_snackbar.dart';
import 'package:bidding_house/features/auth/presentations/controller/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
     List<File> image=[];
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          return snackBar(state.message, context, Colors.red);
        }
        if (state is UploadImageFailure) {
          return snackBar(state.message, context, Colors.red);
        }
        if (state is AuthSuccess) {
          context.go(Routers.bnb);
          return snackBar(state.message, context, Colors.white);
        }
      },
      builder: (context, state) {
        bool login = BlocProvider.of<AuthCubit>(context).login;
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w(context)),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        chooseImages(context).then((value) {
                          image = value;
                          BlocProvider.of<AuthCubit>(context).upLoadImage(value);
                                                },);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 60.w(context),
                        child: image.isEmpty ? Image.asset(AssetService.splash2) : Image.file(
                          image[0],
                          height: 120.h(context),
                        ),),
                    ),
                    TextFormWithName(
                      controller: emailController,
                      text: "jimny@bonder.com",
                      textName: "Email",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Enter email";
                        }
                        if (!(p0.contains('@') || p0.contains('.com'))) {
                          return 'Please enter a valid email !';
                        }
                        return null;
                      },
                    ),
                    SizedBoxApp(h: 33.h(context)),
                    TextFormWithName(
                      controller: passController,
                      text: "**************",
                      textName: "Password",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Enter password";
                        }
                        if (p0.length < 6) {
                          return 'Please enter at least 6 digits';
                        }
                        return null;
                      },
                    ),
                    SizedBoxApp(h: 33.h(context)),
                    if (login == false)
                      TextFormWithName(
                        controller: nameController,
                        text: "Name",
                        textName: "User Name",
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter Name";
                          }
                          return null;
                        },
                      ),
                    SizedBoxApp(h: 11.h(context)),
                    const ForgetPass(),
                    SizedBoxApp(h: 33.h(context)),
                    state is AuthLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Column(
                            children: [
                              AuthButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    if (login != true) {
                                      BlocProvider.of<AuthCubit>(context)
                                          .signUp(
                                              emailController.text,
                                              passController.text,
                                              nameController.text);
                                    } else {
                                      BlocProvider.of<AuthCubit>(context).logIn(
                                        emailController.text,
                                        passController.text,
                                      );
                                    }
                                  }
                                },
                                text: login ? 'Log in' : 'Sign up',
                              ),
                              TextButton(
                                onPressed: () {
                                  BlocProvider.of<AuthCubit>(context)
                                      .changeLogin();
                                },
                                child: Text(
                                  '${login ? 'SignUp' : 'Login'} instead',
                                  style: AppTextStyles.style14_400(
                                      context, CustomColor.blue),
                                ),
                              ),
                            ],
                          ),
                    SizedBoxApp(h: 81.h(context)),
                    const Logo(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
