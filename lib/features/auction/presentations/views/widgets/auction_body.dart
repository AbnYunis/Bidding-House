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
      child: Column(
        children: [
          const AuctionAppBar(),
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
                Map<String, dynamic> data = state.post.data()!;

                return Expanded(
                  child: ListView.builder(
                    itemCount: data["posts"].length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context.push(Routers.userDetailsPost,
                            extra: {'index': index, 'data': data});
                      },
                      child: CustomAuctionItem(
                        data: data["posts"][index],
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
