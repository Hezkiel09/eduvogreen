import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  // === LOG IN ===
  Future<AuthResponse> logIn({
    required String email,
    required String password,
  }) async {
    return await _supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // === Register ===
  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );
  }

  // ===Log Out===
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  // Curent User
  User? get curentUser => _supabaseClient.auth.currentUser;
}
