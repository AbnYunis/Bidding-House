import 'package:bidding_house/core/utils/imports.dart';

class BidView extends StatelessWidget {
  const BidView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BidBody(),
      ),
    );
  }
}
