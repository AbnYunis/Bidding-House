import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/bid/presentation/controllers/bidding_now_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BidView extends StatelessWidget {
  const BidView({super.key, required this.data});

  final Map data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BiddingNowCubit()..getBiddingPeople(data["id"]),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BidBody(data: data,),
        ),
      ),
    );
  }
}
