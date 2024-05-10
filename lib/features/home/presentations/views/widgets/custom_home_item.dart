import 'package:bidding_house/core/utils/imports.dart';

import '../../../../../core/utils/widgets/network_image.dart';

class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final h = SizeApp(context).height;
    final w = SizeApp(context).width;
    return Column(
      children: [
        const MyImage(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5McanARG73EB7PNmo1fjRKFeX75BlB6ZlXu84xHzxMA&s',
        ),
        SizedBoxApp(h: h*.02,),
        Text(
          text,
          style: TextStyle(fontSize: w * .04, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
