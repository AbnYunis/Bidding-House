import 'package:bidding_house/core/utils/imports.dart';

class BidBody extends StatelessWidget {
  const BidBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ImagesSection(),
         SecondBidSection(),
        ],
      ),
    );
  }
}
