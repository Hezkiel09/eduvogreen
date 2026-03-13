part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final String message;
  ProfileSuccess(this.message);
}

class ProfileError extends ProfileState {
  final String errorMessage;
  ProfileError(this.errorMessage);
}
