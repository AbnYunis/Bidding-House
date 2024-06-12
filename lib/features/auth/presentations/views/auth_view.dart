import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/auth/presentations/controller/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: const Scaffold(
          body: AuthBody(),
        ),
      ),
    );
  }
}
