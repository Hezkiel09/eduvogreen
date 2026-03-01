import 'package:flutter_bloc/flutter_bloc.dart';

// EVENT
abstract class RegisterEvent {}

class SubmitRegister extends RegisterEvent {
  final String nama;
  final String email;

  SubmitRegister(this.nama, this.email);
}

// STATE
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String nama;
  final String email;

  RegisterSuccess(this.nama, this.email);
}

// BLOC
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<SubmitRegister>((event, emit) async {
      emit(RegisterLoading());

      await Future.delayed(Duration(seconds: 2)); // loading

      emit(RegisterSuccess(event.nama, event.email));
    });
  }
}