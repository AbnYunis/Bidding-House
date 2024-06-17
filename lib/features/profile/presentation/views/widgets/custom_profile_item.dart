import 'package:bidding_house/core/utils/imports.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.w(context), vertical: 10.h(context)),
      child: Row(
        children: [
          const MyImage(
            imageUrl:
                'https://m.media-amazon.com/images/I/51yR9cIxYPL._AC_SX569_.jpg',
          ),
          SizedBoxApp(
            w: 10.w(context),
          ),
          Expanded(
            child: SizedBox(
              height: 120.h(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Textured Summer Shirt',
                    style:
                        AppTextStyles.style14_800(context, CustomColor.white),
                  ),
                  SizedBox(
                    width: 200.w(context),
                    child: Text(
                      'Black Regular Fit Textured Summer Shirt TMNSS23GO00055',
                      maxLines: 3,
                      style: AppTextStyles.style10_800(context),
                    ),
                  ),
                  Text(
                    ' The price  \$${500}',
                    style: AppTextStyles.style10_800Price(context),
                  ),
                  Text(
                    '11 Nov 2023',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        AppTextStyles.style12_800(context, CustomColor.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
