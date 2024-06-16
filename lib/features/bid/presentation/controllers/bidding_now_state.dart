part of 'bidding_now_cubit.dart';

sealed class BiddingNowState {}

final class BiddingNowInitial extends BiddingNowState {}
final class BiddingNowLoading extends BiddingNowState {}
final class BiddingNowFailure extends BiddingNowState {
  final String message ;

  BiddingNowFailure(this.message);
}
final class BiddingNowSuccess extends BiddingNowState {
  final List posts;
  BiddingNowSuccess(this.posts);
}
