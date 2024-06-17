import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/profile/presentation/controller/profile_cubit.dart';
import 'package:bidding_house/features/profile/presentation/views/widgets/profile_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(),
      child: const SafeArea(
        child: Scaffold(
          body: ProfileBody(),
        ),
      ),
    );
  }
}
