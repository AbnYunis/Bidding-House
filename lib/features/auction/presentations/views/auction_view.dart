import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/auction/presentations/controller/auction_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionView extends StatelessWidget {
  const AuctionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuctionCubit>(
      create: (context) => AuctionCubit()..getAuction(),
      child: const SafeArea(
        child: Scaffold(
          body: AuctionBody(),
        ),
      ),
    );
  }
}
