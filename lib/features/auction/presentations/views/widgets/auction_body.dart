import 'package:bidding_house/core/utils/imports.dart';

class AuctionBody extends StatelessWidget {
  const AuctionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 26.w(context)),
      child: Column(
        children: [
          const AuctionAppBar(),
          SizedBoxApp(
            h: 57.h(context),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 135.w(context) / 200.h(context),
                crossAxisCount: 2,
                crossAxisSpacing: 15.w(context),
                mainAxisSpacing: 12.h(context),
              ),
              itemCount: 8,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    const MyImage(imageUrl: "https://picsum.photos/200/300"),
                    SizedBoxApp(h: 3.h(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arabian horse",
                              style: AppTextStyles.style10_700(
                                  context, CustomColor.white),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "current Bid",
                                      style: AppTextStyles.style7_700(
                                          context, CustomColor.grey),
                                    ),
                                    Text(
                                      "\$2500",
                                      style: AppTextStyles.style8_400(
                                          context, CustomColor.yellow),),
                                  ],
                                ),
                                SizedBoxApp(w: 10.w(context)),
                                MaterialButton(
                                  height: 25.h(context),
                                  minWidth: 50.w(context),
                                  onPressed: () {},
                                  color: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  child: const Text(
                                    'Bid Now',
                                    style: TextStyle(fontSize: 9, color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                      ],
                    )
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
