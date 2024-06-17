part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final DocumentSnapshot<Map<String, dynamic>> post;

  ProfileSuccess(this.post);
}

final class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure(this.message);
}
