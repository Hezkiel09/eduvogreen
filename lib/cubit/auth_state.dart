part of 'auth_cubit.dart';

// States
class AuthState {}

class Loading extends AuthState {}

class Success extends AuthState {
  final UserModel user;
  Success(this.user);
}

class AuthError extends AuthState {
  final String errorMessage;
  AuthError(this.errorMessage);
}

class Initial extends AuthState {}

class LoggedOut extends AuthState {}
