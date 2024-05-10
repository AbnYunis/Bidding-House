import 'package:bidding_house/core/utils/imports.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AuthBody(),
      ),
    );
  }
}
