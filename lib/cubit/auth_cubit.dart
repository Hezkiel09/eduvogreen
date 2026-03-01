import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/auth_service.dart';
import '../data/models/user_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit({AuthService? authService})
    : _authService = authService ?? AuthService(),
      super(Initial());

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

  // Current user
  dynamic get currentUser => _authService.curentUser;

  void resetPassword() {}
  void updatePassword() {}
  void signInGoogle() {}
}
