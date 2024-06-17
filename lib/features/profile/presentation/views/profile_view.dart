import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/profile/presentation/views/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ProfileBody(),
      ),
    );
  }
}
