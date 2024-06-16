import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/bid/presentation/views/widgets/bid_appbar.dart';


class BidBody extends StatelessWidget {
  const BidBody({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Column(
          children: [
            Expanded(child: ImagesSection(images: data["images"],)),
           Expanded(child: SecondBidSection(data:data)),
          ],
        ),
        const BidDetailsAppBar(),
      ],
    );
  }
}
