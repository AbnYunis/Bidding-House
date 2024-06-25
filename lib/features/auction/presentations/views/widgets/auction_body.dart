import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/auction/presentations/controller/auction_cubit.dart';
import 'package:bidding_house/features/auction/presentations/views/widgets/custom_auction_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionBody extends StatelessWidget {
  const AuctionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w(context)),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const AuctionAppBar(),
            SizedBoxApp(
              h: 20.h(context),
            ),
            const TabBar(
              tabs: [
                Tab(
                  text: "Active",
                ),
                Tab(
                  text: "Past",
                ),
              ],
            ),
            SizedBoxApp(
              h: 20.h(context),
            ),
            BlocConsumer<AuctionCubit, AuctionState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is AuctionFailure) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is AuctionSuccess) {
                  List activeData = state.post.data()!["posts"]
                      .where((element) => DateTime.parse(element["date"]).isAfter(DateTime.now()))
                      .toList();
                  List pastData = state.post.data()!["posts"]
                      .where((element) => DateTime.parse(element["date"]).isBefore(DateTime.now()))
                      .toList();
                  return Expanded(
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: activeData.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              context.push(Routers.userDetailsPost,
                                  extra: {'index': index, 'data': activeData[index]});
                            },
                            child: CustomAuctionItem(
                              data: activeData[index],
                            ),
                          ),
                        ),
                        ListView.builder(
                          itemCount: pastData.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              context.push(Routers.userDetailsPost,
                                  extra: {'index': index, 'data': pastData[index]});
                            },
                            child: CustomAuctionItem(
                              data: pastData[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
