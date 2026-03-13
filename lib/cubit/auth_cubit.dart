import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../auth/auth_service.dart';
import '../data/models/user_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit({AuthService? authService})
    : _authService = authService ?? AuthService(),
      super(Initial()) {
    restoreSession();
  }

  // Cek apakah ada session yang aktif (biar nggak login ulang terus)
  Future<void> restoreSession() async {
    final user = _authService.curentUser;
    if (user != null) {
      emit(Loading());
      try {
        // Ambil data profile dari tabel profiles
        final profile = await Supabase.instance.client
            .from('profiles')
            .select()
            .eq('id', user.id)
            .maybeSingle();

        if (profile != null) {
          emit(Success(UserModel.fromSupabase(profile, user.email ?? '')));
        } else {
          // Jika profile belum ada, buat minimal dari auth metadata
          emit(
            Success(
              UserModel(
                id: user.id,
                namaPanjang: user.userMetadata?['name'] as String?,
                email: user.email ?? '',
                username: user.userMetadata?['username'] as String? ?? '',
                fotoProfil: user.userMetadata?['avatar_url'] as String?,
                tanggalLahir: user.userMetadata?['tanggal_lahir'] as String?,
              ),
            ),
          );
        }
      } catch (e) {
        print('Error restoring session: $e');
        emit(LoggedOut());
      }
    }
  }

  // Login dengan email & password
  Future<void> login(String email, String password) async {
    emit(Loading());
    try {
      final response = await _authService.logIn(
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
            id: user.id,
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
      final response = await _authService.signUp(
        name: name,
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        emit(AuthError('Registrasi gagal: user tidak ditemukan'));
        return;
      }

      emit(
        Success(
          UserModel(
            id: user.id,
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
    await _authService.signOut();
    emit(LoggedOut());
  }

  // Update state lokal untuk User (dipanggil oleh ProfileCubit setelah sukses update DB)
  void updateUserLocally({required String name, required String username}) {
    final currentState = state;
    if (currentState is Success) {
      final updatedUser = UserModel(
        id: currentState.user.id,
        namaPanjang: name,
        email: currentState.user.email,
        username: username,
        fotoProfil: currentState.user.fotoProfil,
        tanggalLahir: currentState.user.tanggalLahir,
      );
      emit(Success(updatedUser));
    }
  }

  // Current user
  User? get currentUser => _authService.curentUser;

  void resetPassword() {}
  void updatePassword() {}
  void signInGoogle() {}
}
