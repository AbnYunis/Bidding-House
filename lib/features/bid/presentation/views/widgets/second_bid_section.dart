import 'package:bidding_house/core/utils/imports.dart';

class SecondBidSection extends StatelessWidget {
  const SecondBidSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:448.h(context) ,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff14181B),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.all(15.w(context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Samsung Galaxy A55',
                style:
                AppTextStyles.style24_700(context, CustomColor.white),
              ),
              SizedBoxApp(
                h: 5.h(context),
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2of0Y-HF1rRZGFR0XpuOU9f40bcLqQEUgaQ&s'),
                  ),
                  SizedBoxApp(
                    w: 7.w(context),
                  ),
                  Text(
                    'Milinda Peterson',
                    style: AppTextStyles.style14_400(
                        context, CustomColor.white),
                  ),
                ],
              ),
              SizedBoxApp(
                h: 20.w(context),
              ),
              Text(
                'Description',
                style:
                AppTextStyles.style14_800(context, CustomColor.yellow),
              ),
              Text(
                'The phone with a water -resistant glass design and the phone works with the new Samsung processor Exynos 1480 with a super amplid screen 120Hz and a 50 -megapixel rear camera with optical stabilizer and a 32 -megapixel front camera and a battery with a capacity of 5000 mASupports the NFC feature.The phone supports two Nano SIM calls.The 2G, 3G, 4G and 5G communication networks support the second generation.The phone comes with dimensions of 161.1 x 77.4 x 8.2 mm.',
                style:
                AppTextStyles.style14_400(context, CustomColor.white),
              ),
              SizedBoxApp(
                h: 15.h(context),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffD9D9D9),
                  ),
                  height: 50.h(context),
                  width: 270.w(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove,
                          color: Color(0xff73807F),
                        ),
                      ),
                      Text(
                        '\$ 10.000',
                        style: AppTextStyles.style14_800(
                            context, CustomColor.yellow),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xff73807F),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBoxApp(
                h: 10.h(context),
              ),
              Center(
                child: MaterialButton(
                  height: 50.h(context),
                  minWidth: 270.w(context),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentView()));
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    'Bid Now',
                    style: AppTextStyles.style20_800(
                        context, CustomColor.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
