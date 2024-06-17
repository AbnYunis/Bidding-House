import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/profile/presentation/views/widgets/custom_profile_item.dart';
class ProfileListItems extends StatelessWidget {
  const ProfileListItems({super.key, required this.posts});
  final List posts;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) =>
            CustomProfileItem(data: posts[index],)
      ),
    );
  }
}
