import 'package:bidding_house/core/utils/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
           vertical: 10.h(context)),
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
                  if(data['uId']==FirebaseAuth.instance.currentUser!.uid)
                    Text(
                    data['date'].toString().substring(0,data['date'].toString().indexOf("T")),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        AppTextStyles.style12_800(context, CustomColor.white),
                  ),
                  if(data['uId']!=FirebaseAuth.instance.currentUser!.uid)...[
                    IsSoldOrNot(data: data)
                  ]

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IsSoldOrNot extends StatefulWidget {
  const IsSoldOrNot({
    super.key,
    required this.data,
  });

  final Map data;

  @override
  State<IsSoldOrNot> createState() => _IsSoldOrNotState();
}

class _IsSoldOrNotState extends State<IsSoldOrNot> {
  late Duration isSold = const Duration();

  @override
  void initState() {
    isSold = DateTime.parse(widget.data['date']).difference(DateTime.now());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  BidView(data:widget.data,)));
            },
            color: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)),
            child: Text(
              isSold.isNegative ? "Sold" : 'Bid Now',
              style:
              const TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
