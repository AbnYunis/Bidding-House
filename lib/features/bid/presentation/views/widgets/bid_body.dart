import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/bid/presentation/views/widgets/bid_appbar.dart';


class BidBody extends StatelessWidget {
  const BidBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
         Column(
          children: [
            Expanded(child: ImagesSection()),
           Expanded(child: SecondBidSection()),
          ],
        ),
        BidDetailsAppBar(),
      ],
    );
  }
}
