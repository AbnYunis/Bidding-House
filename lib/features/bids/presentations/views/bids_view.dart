import 'package:bidding_house/core/utils/imports.dart';

class BidsView extends StatelessWidget {
  const BidsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: BidsBody(),
    ),);
  }
}
