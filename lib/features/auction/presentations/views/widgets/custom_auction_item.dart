import 'package:bidding_house/core/utils/imports.dart';

class CustomAuctionItem extends StatelessWidget {
  const CustomAuctionItem({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.w(context), vertical: 10.h(context)),
      child: Row(
        children: [
          MyImage(
            imageUrl:
            data["images"][0],
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
                    data["title"],
                    style:
                    AppTextStyles.style14_800(context, CustomColor.white),
                  ),
                  SizedBox(
                    width: 200.w(context),
                    child: Text(
                      data["desc"],
                      maxLines: 3,
                      style: AppTextStyles.style10_800(context),
                    ),
                  ),
                  Text(
                    ' The price  \$${data["price"]}',
                    style: AppTextStyles.style10_800Price(context),
                  ),
                  Text(
                    data['date'].toString().substring(0,data['date'].toString().indexOf("T")),
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
