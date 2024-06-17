import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/profile/presentation/views/widgets/custom_profile_item.dart';
class ProfileListItems extends StatelessWidget {
  const ProfileListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) =>
           const CustomProfileItem()
      ),
    );
  }
}
