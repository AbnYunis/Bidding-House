import 'package:bidding_house/core/utils/imports.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> itemsName = [
      'Real Estate',
      'Hours',
      'Cars',
      'Mobiles',
      'Clothes & Shoes',
      'Paint Art',
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w(context)),
      child: Column(
        children: [
          const HomeAppBar(),
          SizedBoxApp(
            h: 57.h(context),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 130.w(context) / 173.h(context),
                crossAxisCount: 2,
                crossAxisSpacing: 20.w(context),
                mainAxisSpacing: 20.h(context),
              ),
              itemCount: itemsName.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryView(title: itemsName[index]),
                      ));
                },
                child: CustomHomeItem(
                  text: itemsName[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
