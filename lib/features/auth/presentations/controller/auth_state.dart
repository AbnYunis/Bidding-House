part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class UploadImageLoading extends AuthState {}

final class UploadImageFailure extends AuthState {
  final String message;

  UploadImageFailure(this.message);
}

final class UploadImageSuccess extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
