import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/bid/presentation/controllers/bidding_now_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondBidSection extends StatefulWidget {
  const SecondBidSection({super.key, required this.data});

  final Map data;

  @override
  State<SecondBidSection> createState() => _SecondBidSectionState();
}

class _SecondBidSectionState extends State<SecondBidSection> {
  late int bigPrice;
  late int price;

  @override
  void initState() {
    super.initState();
    bigPrice = int.parse(widget.data["price"]);
    price = int.parse(widget.data["price"]);
  }

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
                widget.data["title"],
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
                widget.data["desc"],
                style: AppTextStyles.style14_400(context, CustomColor.white),
              ),
              SizedBoxApp(
                h: 15.h(context),
              ),
              BlocConsumer<BiddingNowCubit, BiddingNowState>(
                listener: (context, state) {
                  if (state is BiddingNowSuccess) {
                    if (state.posts.isNotEmpty) {
                      setState(() {
                        bigPrice = state.posts
                            .map((person) => int.parse(person['price']!))
                            .reduce((a, b) => a > b ? a : b);
                        price = state.posts
                            .map((person) => int.parse(person['price']!))
                            .reduce((a, b) => a > b ? a : b);
                      });
                    }
                  }
                },
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
                                onPressed: () {
                                  if (price > bigPrice) {
                                    price -= 500;
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Color(0xff73807F),
                                ),
                              ),
                              if (state is BiddingNowSuccess)
                                Text(
                                  '\$$price',
                                  style: AppTextStyles.style14_800(
                                      context, CustomColor.yellow),
                                ),
                              IconButton(
                                onPressed: () {
                                  price += 500;
                                  setState(() {});
                                },
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
                        child: state is BiddingNowUpdateLoading ?const CircularProgressIndicator(): MaterialButton(
                          height: 50.h(context),
                          minWidth: 270.w(context),
                          onPressed: () {
                            if(price > bigPrice) {
                              context
                                  .read<BiddingNowCubit>()
                                  .updateBiddingPeople( price.toString(),widget.data['id'],);
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) =>  BidView(data:widget.data,)));
                            }
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
