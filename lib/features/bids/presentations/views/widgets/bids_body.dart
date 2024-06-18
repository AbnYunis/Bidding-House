import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/bids/presentations/controllers/my_bids_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BidsBody extends StatelessWidget {
  const BidsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final myBidsCubit = BlocProvider.of<MyBidsCubit>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w(context)),
      child: Column(
        children: [
          const BidsAppBar(),
          SizedBoxApp(h: 57.h(context)),
          Expanded(
            child: BlocBuilder<MyBidsCubit, MyBidsState>(
              builder: (context, state) {
                if (state is MyBidsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final posts = myBidsCubit.posts;

                  if (posts.isEmpty) {
                    return const Center(
                      child: Text('No posts available'),
                    );
                  }

                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBoxApp(h: 20.h(context)),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return MyBidItem(post: post, index: index);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyBidItem extends StatefulWidget {
  const MyBidItem({
    super.key,
    required this.post,
    required this.index,
  });

  final Map<String, dynamic> post;
  final int index;

  @override
  State<MyBidItem> createState() => _MyBidItemState();
}

class _MyBidItemState extends State<MyBidItem> {
  late dynamic myBidsCubit;
  @override
  void initState() {
    myBidsCubit = BlocProvider.of<MyBidsCubit>(context);

    // Ensure getBiddingPeople is called for each post
    Future.microtask(() {
      myBidsCubit.getBiddingPeople(widget.post["id"]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          MyImage(
            imageUrl: widget.post["images"][0],
          ),
          SizedBoxApp(w: 10.w(context)),
          Expanded(  // Use Expanded here to ensure the remaining space is filled
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post["title"],
                  style: AppTextStyles.style12_800(context, CustomColor.white),
                ),
                SizedBoxApp(h: 10.h(context)),
                Text(
                  "Current Bid \$${widget.post["price"]}",
                  style: AppTextStyles.style7_700(context, CustomColor.grey),
                ),
                SizedBoxApp(h: 10.h(context)),
                BlocBuilder<MyBidsCubit, MyBidsState>(
                  builder: (context, state) {
                    final soldForYou = myBidsCubit.soldForYou;

                    // Check if the index is valid
                    if (widget.index >= myBidsCubit.soldFor.length) {
                      return const SizedBox.shrink();
                    } else if (DateTime.parse(widget.post['date'])
                        .difference(DateTime.now())
                        .isNegative) {
                      final soldForPrice =
                      myBidsCubit.soldFor[widget.index]["price"];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sold For \$$soldForPrice",
                            style: AppTextStyles.style12_800(context, CustomColor.white),
                          ),
                          SizedBoxApp(h: 10.h(context)),
                          MaterialButton(
                            height: 25.h(context),
                            minWidth: 50.w(context),
                            onPressed: () {
                              GoRouter.of(context).go(Routers.payment) ;

                            },
                            color: soldForYou ? Colors.green : Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text(
                              soldForYou ? 'You have won' : 'You have not won',
                              style: const TextStyle(fontSize: 9, color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,  // Set mainAxisSize to min
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.watch_later_rounded,
                                color: Colors.white,
                              ),
                              SizedBoxApp(
                                w: 5.w(context),
                              ),
                              CountdownTimer(
                                deadlineString: widget.post["date"],
                                onTimerEnd: (p0) {

                                },
                              ),
                            ],
                          ),
                          MaterialButton(
                            height: 25.h(context),
                            minWidth: 30.w(context),
                            onPressed: () {
                              GoRouter.of(context).go(Routers.biddingNow,extra: widget.post); ;
                            },
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            child: const Text(
                              'Bid Now',
                              style: TextStyle(fontSize: 9, color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
