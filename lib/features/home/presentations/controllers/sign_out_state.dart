part of 'sign_out_cubit.dart';

@immutable
sealed class SignOutState {}

final class SignOutInitial extends SignOutState {}

final class SignOutLoading extends SignOutState {}

final class SignOutSuccess extends SignOutState {
  final String message;

  SignOutSuccess(this.message);
}

final class SignOutFailure extends SignOutState {
  final String message;

  SignOutFailure(this.message);
}

final class HomeDataLoading extends SignOutState {}

final class HomeDataSuccess extends SignOutState {
  final QuerySnapshot<Object?> message;

  HomeDataSuccess(this.message);
}

final class HomeDataFailure extends SignOutState {
  final String message;

  HomeDataFailure(this.message);
}