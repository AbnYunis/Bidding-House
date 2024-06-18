part of 'my_bids_cubit.dart';

sealed class MyBidsState {}

final class MyBidsInitial extends MyBidsState {}
final class MyBidsLoading extends MyBidsState {}
final class MyBidsFailure extends MyBidsState {
  final String message ;

  MyBidsFailure(this.message);
}
final class MyBidsSuccess extends MyBidsState {
}
final class MyBidsUpdateLoading extends MyBidsState {}
final class MyBidsUpdateFailure extends MyBidsState {
  final String message ;

  MyBidsUpdateFailure(this.message);
}
final class MyBidsUpdateSuccess extends MyBidsState {
  final List posts;
  MyBidsUpdateSuccess(this.posts);
}