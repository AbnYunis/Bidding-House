part of 'auction_cubit.dart';

@immutable
sealed class AuctionState {}

final class AuctionInitial extends AuctionState {}

final class AuctionLoading extends AuctionState {}

final class AuctionSuccess extends AuctionState {
  final DocumentSnapshot<Map<String, dynamic>> post;

  AuctionSuccess(this.post);
}

final class AuctionFailure extends AuctionState {
  final String message;

  AuctionFailure(this.message);
}
