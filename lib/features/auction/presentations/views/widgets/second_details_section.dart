import 'package:bidding_house/features/bid/presentation/controllers/bidding_now_cubit.dart';
import 'package:bidding_house/features/bid/presentation/views/widgets/bidding_people.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/imports.dart';
import '../../../../profile/presentation/controller/profile_cubit.dart';

class SecondDetailsSection extends StatelessWidget {
  final Map<String, dynamic> data;

  const SecondDetailsSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff14181B),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.all(15.w(context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["data"]["title"],
                style: AppTextStyles.style24_700(context, CustomColor.white),
              ),
              SizedBoxApp(
                h: 5.h(context),
              ),
              BlocProvider(
                create: (context) =>
                ProfileCubit()..getProfile(id: data["data"]["uId"]),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProfileSuccess) {
                      return Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                state.post.data()!["profileImage"]),
                          ),
                          SizedBoxApp(
                            w: 7.w(context),
                          ),
                          Text(
                            state.post.data()!["username"],
                            style: AppTextStyles.style14_400(
                                context, CustomColor.white),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/3135/3135715.png')),
                          SizedBoxApp(
                            w: 7.w(context),
                          ),
                          Text(
                            'User Name',
                            style: AppTextStyles.style14_400(
                                context, CustomColor.white),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              SizedBoxApp(
                h: 20.w(context),
              ),
              Text(
                'Description',
                style: AppTextStyles.style14_800(context, CustomColor.yellow),
              ),
              Text(
                data["data"]["desc"],
                style: AppTextStyles.style14_400(context, CustomColor.white),
              ),
              SizedBoxApp(
                h: 15.h(context),
              ),
              Text(
                'Bidding People',
                style: AppTextStyles.style16_800(context, CustomColor.white),
              ),
              SizedBoxApp(
                h: 15.h(context),
              ),
              BlocProvider(
                create: (context) => BiddingNowCubit()
                  ..getBiddingPeople(data["data"]["id"]),
                child: BlocBuilder<BiddingNowCubit, BiddingNowState>(
                  builder: (context, state) {
                    if (state is BiddingNowFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is BiddingNowSuccess) {
                      return BiddingPeople(data: state.posts);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
