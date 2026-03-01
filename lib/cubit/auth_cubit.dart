import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/models/user_model.dart';

class AuthState {}

class Loading extends AuthState {}

class Success extends AuthState {
  final UserModel user;

  Success(this.user);
}

class Error extends AuthState {
  final String errorMessage;

  Error(this.errorMessage);
}

class Initial extends AuthState {}

// Cubit
class AuthCubit extends Cubit<AuthState> {
  final SupabaseClient supabase = Supabase.instance.client;

  AuthCubit() : super(Initial());

  Future<void> login(String email, String password) async {
    emit(Loading());
    try {
      final response = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );

      // emit(
      //   // Success(
      //   //   UserModel(nama: response.user?.userMetadata!['name'], email: email),
      //   // ),
      // );
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(Loading());
    try {
      final response = await supabase.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );

      // emit(Success(UserModel(nama: name, email: email)));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void resetPassword() {}
  void updatePassword() {}

  void signInGoogle() {}
}
