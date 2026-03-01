import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/models/user_model.dart';

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

// Cubit
class AuthCubit extends Cubit<AuthState> {
  final SupabaseClient supabase = Supabase.instance.client;

  AuthCubit() : super(Initial());

  // Login dengan email & password
  Future<void> login(String email, String password) async {
    emit(Loading());
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        emit(AuthError('Login gagal: user tidak ditemukan'));
        return;
      }

      emit(
        Success(
          UserModel(
            namaPanjang: user.userMetadata?['name'] as String?,
            email: user.email ?? '',
            username: user.userMetadata?['username'] as String? ?? '',
            fotoProfil: user.userMetadata?['avatar_url'] as String?,
            tanggalLahir: user.userMetadata?['tanggal_lahir'] as String?,
          ),
        ),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Register dengan nama, email, dan password
  Future<void> register(String name, String email, String password) async {
    emit(Loading());
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      final user = response.user;
      if (user == null) {
        emit(AuthError('Registrasi gagal: user tidak ditemukan'));
        return;
      }

      emit(
        Success(
          UserModel(
            namaPanjang: name,
            email: email,
            username: '',
            fotoProfil: null,
            tanggalLahir: null,
          ),
        ),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await supabase.auth.signOut();
    emit(LoggedOut());
  }

  void resetPassword() {}
  void updatePassword() {}
  void signInGoogle() {}
}
