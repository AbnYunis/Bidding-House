import 'package:bidding_house/core/utils/imports.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: EditProfileBody(),
      ),
    );
  }
}
