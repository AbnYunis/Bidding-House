part of 'bids_cubit.dart';

sealed class GetPostState {}

final class GetPostInitial extends GetPostState {}
final class GetPostLoading extends GetPostState {}
final class GetPostFailure extends GetPostState {
  final String message ;

  GetPostFailure(this.message);
}
final class GetPostSuccess extends GetPostState {
  final List posts;
  GetPostSuccess(this.posts);
}
