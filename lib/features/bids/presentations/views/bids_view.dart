import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/bids/presentations/controllers/my_bids_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BidsView extends StatelessWidget {
  const BidsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyBidsCubit()..updateBiddingPeople(),
      child: SafeArea(child: Scaffold(
        body: BidsBody(),
      ),),
    );
  }
}
