import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/profile/presentation/views/widgets/custom_profile_item.dart';

class ProfileListItems extends StatelessWidget {
  const ProfileListItems({super.key, required this.posts});

  final List posts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                context.push(Routers.biddingNow, extra: posts[index]);
              },
              child: CustomProfileItem(
                data: posts[index],
              ))),
    );
  }
}
