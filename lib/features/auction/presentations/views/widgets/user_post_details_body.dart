import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/auction/presentations/views/widgets/second_details_section.dart';

import '../../../../bid/presentation/views/widgets/bid_appbar.dart';

class UserPostDetailsBody extends StatelessWidget {
  final Map<String, dynamic> data;

  const UserPostDetailsBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    int index = data["index"];
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ImagesSection(
                images: data["data"]["posts"][index]["images"],
              ),
            ),
            Expanded(
              child: SecondDetailsSection(data: data),
            ),
          ],
        ),
        const BidDetailsAppBar(),
      ],
    );
  }
}
