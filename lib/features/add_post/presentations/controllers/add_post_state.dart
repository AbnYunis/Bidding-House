part of 'add_post_cubit.dart';

@immutable
sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}
final class AddPostLoading extends AddPostState {}
final class AddPostFailure extends AddPostState {
  final String message ;

  AddPostFailure(this.message);
}
final class AddPostSuccess extends AddPostState {
   final String message;

  AddPostSuccess(this.message);
}
