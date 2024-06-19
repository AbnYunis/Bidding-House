import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/profile/presentation/controller/profile_cubit.dart';
import 'package:bidding_house/features/profile/presentation/views/widgets/profile_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, this.userId, });
  final String? userId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if(userId==null) {
          return ProfileCubit()..getProfile();
        }
        return ProfileCubit()..getProfile(id: userId!);
      },
      child:  SafeArea(
        child: Scaffold(
          appBar: userId==null?null:AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor:Colors.transparent,
            leading:IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white70,),),
          ),
          body: const ProfileBody(),
        ),
      ),
    );
  }
}
