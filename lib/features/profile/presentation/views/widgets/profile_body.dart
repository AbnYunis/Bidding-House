import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/profile/presentation/controller/profile_cubit.dart';
import 'package:bidding_house/features/profile/presentation/views/widgets/profile_list_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is ProfileSuccess
            ? Padding(
                padding: EdgeInsets.all(15.w(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            state.post.data()!["username"],
                            style: AppTextStyles.style20_800(
                                context, CustomColor.white),
                          ),
                          SizedBoxApp(
                            h: 10.h(context),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30.w(context),
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 27.w(context),
                              child: Icon(
                                Icons.perm_identity,
                                color: Colors.white,
                                size: 50.w(
                                  context,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (state.post.data()!["posts"][0]['uId'] !=
                        FirebaseAuth.instance.currentUser!.uid) ...[
                      SizedBoxApp(
                        h: 10.h(context),
                      ),
                      StarRating(
                        rating: state.post.data()!["posts"].length > 5
                            ? 5
                            : state.post.data()!["posts"].length.toDouble(),
                        starCount: 5,
                      ),
                    ],
                    SizedBoxApp(
                      h: 20.h(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.w(context),
                      ),
                      child: Text(
                        'Sales',
                        style: AppTextStyles.style14_800(
                            context, CustomColor.white),
                      ),
                    ),
                    ProfileListItems(
                      posts: state.post.data()!["posts"],
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
