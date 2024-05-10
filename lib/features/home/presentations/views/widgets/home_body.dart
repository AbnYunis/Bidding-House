import 'package:bidding_house/core/utils/imports.dart';

import 'custom_home_item.dart';
import 'home_appbar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> itemsName = [
      'Real Estate',
      'Hours',
      'Cars',
      'Mobiles',
      'Clothes and Shoes',
      'Paint Art',
    ];
    final h = SizeApp(context).height;
    final w = SizeApp(context).width;
    return Padding(
      padding:  EdgeInsets.all(w*.05),
      child: Column(
        children: [
          const HomeAppBar(),
           SizedBoxApp(
           h:  h*.04,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: h*.03,
              crossAxisSpacing: w*.04,
              children: List.generate(
                  6,
                  (index) => CustomHomeItem(
                        text: itemsName[index],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
