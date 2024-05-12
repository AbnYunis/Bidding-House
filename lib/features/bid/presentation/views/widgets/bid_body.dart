import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/bid/presentation/views/widgets/bid_appbar.dart';


class BidBody extends StatelessWidget {
  const BidBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
         Column(
          children: [
            SizedBoxApp(h: 35.h(context),),
            const Expanded(child: ImagesSection()),
           const Expanded(child: SecondBidSection()),
          ],
        ),
        const BidDetailsAppBar(),
      ],
    );
  }
}
