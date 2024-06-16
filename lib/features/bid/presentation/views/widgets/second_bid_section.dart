import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/bid/presentation/controllers/bidding_now_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondBidSection extends StatelessWidget {
  const SecondBidSection({super.key, required this.data});

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                data["title"],
                style: AppTextStyles.style24_700(context, CustomColor.white),
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
                    style:
                        AppTextStyles.style14_400(context, CustomColor.white),
                  ),
                ],
              ),
              SizedBoxApp(
                h: 20.w(context),
              ),
              Text(
                'Description',
                style: AppTextStyles.style14_800(context, CustomColor.yellow),
              ),
              Text(
                data["desc"],
                style: AppTextStyles.style14_400(context, CustomColor.white),
              ),
              SizedBoxApp(
                h: 15.h(context),
              ),
              BlocConsumer<BiddingNowCubit, BiddingNowState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    children: [
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
                              if (state is BiddingNowSuccess)
                                Text(
                                  state.posts.isEmpty?'\$${data["price"]}':"\$${state.posts.map((person) => int.parse(person['price']!)).reduce((a, b) => a > b ? a : b)}",
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
                          onPressed: () {},
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
