import 'package:bidding_house/core/utils/imports.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w(context),vertical: 10.h(context)),
      child: Row(
        children: [
          const MyImage(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5McanARG73EB7PNmo1fjRKFeX75BlB6ZlXu84xHzxMA&s',
          ),
          SizedBoxApp(
            w: 10.w(context),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rolex',
                style: AppTextStyles.style14_800(context, CustomColor.white),
              ),
              SizedBox(
                width: 200.w(context),
                child: Text(
                  maxLines: 3,
                  'A luxurious diving watch made of stainless steel',
                  style: AppTextStyles.style10_800(context),
                ),
              ),
              Text(
                ' The price  \$8,000',
                style: AppTextStyles.style10_800Price(context),
              ),
              Text(
                '18 Oct 2023',
                style: AppTextStyles.style12_800(context, CustomColor.white),
              ),
              SizedBox(
                height: 30.h(context),
                child: Row(
                  children: [
                    const Icon(
                      Icons.watch_later_rounded,
                      color: Colors.white,
                    ),
                    SizedBoxApp(
                      w: 5.w(context),
                    ),
                    Text(
                      '5 Days 21:45:02',
                      style:
                          AppTextStyles.style12_800(context, CustomColor.white),
                    ),
                    SizedBoxApp(
                      w: 10.w(context),
                    ),
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
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
