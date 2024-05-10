import 'package:bidding_house/core/utils/imports.dart';

class AuctionView extends StatelessWidget {
  const AuctionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: AuctionBody(),
    ),);
  }
}
