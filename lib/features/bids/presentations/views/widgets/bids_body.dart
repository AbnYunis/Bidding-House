import 'package:bidding_house/core/utils/imports.dart';

class BidsBody extends StatelessWidget {
  const BidsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 26.w(context)),
      child: Column(
        children: [
          const BidsAppBar(),
          SizedBoxApp(
            h: 57.h(context),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBoxApp(h: 20.h(context)),
              itemCount: 8,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const MyImage(
                      imageUrl: "https://picsum.photos/200/300",
                    ),
                    SizedBoxApp(w: 20.w(context)),
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arabian horse",
                              style: AppTextStyles.style12_800(
                                  context, CustomColor.white),
                            ),
                            SizedBoxApp(h: 10.h(context)),
                            Text(
                              "current Bid \$2500",
                              style: AppTextStyles.style7_700(
                                  context, CustomColor.grey),
                            ),
                            SizedBoxApp(h: 10.h(context)),
                            Text(
                              "Sold For \$40m",
                              style: AppTextStyles.style12_800(
                                  context, CustomColor.white),
                            ),
                            SizedBoxApp(w: 10.h(context)),
                            MaterialButton(
                              height: 25.h(context),
                              minWidth: 50.w(context),
                              onPressed: () {},
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Text(
                                'You have won',
                                style: TextStyle(fontSize: 9, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                  ],
                ),



              ),
            ),
          ),
        ],
      ),
    );
  }
}
