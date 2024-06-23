import 'package:bidding_house/core/utils/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomCategoryItem extends StatefulWidget {
  const CustomCategoryItem({super.key, required this.data});

  final Map data;

  @override
  CustomCategoryItemState createState() => CustomCategoryItemState();
}

class CustomCategoryItemState extends State<CustomCategoryItem> {
  late Duration isSold = const Duration();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.w(context), vertical: 10.h(context)),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Row(
            children: [
              MyImage(
                imageUrl: widget.data["images"][0],
              ),
              SizedBoxApp(
                w: 10.w(context),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Added crossAxisAlignment property
                      children: [
                        Text(
                          widget.data["title"].toString(),
                          style: AppTextStyles.style14_800(
                              context, CustomColor.white),
                        ),
                        SizedBox(
                          width: 200.w(context),
                          child: Text(
                            widget.data["desc"],
                            maxLines: 3,
                            style: AppTextStyles.style10_800(context),
                          ),
                        ),
                        Text(
                          ' The price  \$${widget.data["price"]}',
                          style: AppTextStyles.style10_800Price(context),
                        ),
                        Text(
                          widget.data["location"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.style12_800(
                              context, CustomColor.white),
                        ),
                      ],
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
                          CountdownTimer(
                            deadlineString: widget.data["date"],
                            onTimerEnd: (p0) {
                              setState(() {
                                isSold = p0 ?? const Duration(days: 0);
                              });
                            },
                          ),
                          const Spacer(),
                          MaterialButton(
                            height: 25.h(context),
                            minWidth: 30.w(context),
                            onPressed: isSold.isNegative
                                ? () {}
                                : () {
                                    context.push(Routers.biddingNow,
                                        extra: widget.data);
                                  },
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            child: Text(
                              isSold.isNegative ? "Sold" : 'Bid Now',
                              style: const TextStyle(
                                  fontSize: 9, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (widget.data['uId'] !=
                  FirebaseAuth.instance.currentUser!.uid) {
                context.push(Routers.profile, extra: widget.data["uId"]);
              }
            },
            child: CircleAvatar(
              radius: 20.w(context),
              backgroundImage: const NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
            ),
          ),
        ],
      ),
    );
  }
}
