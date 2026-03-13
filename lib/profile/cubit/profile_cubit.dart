import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../cubit/auth_cubit.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthCubit authCubit; // Dependensi ke AuthCubit

  ProfileCubit({required this.authCubit}) : super(ProfileInitial());

  // Update Profile
  Future<void> updateProfile({required String name, required String username}) async {
    final currentAuthState = authCubit.state;
    if (currentAuthState is! Success) {
      emit(ProfileError('Kamu belum login!'));
      return;
    }

    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      emit(ProfileError('Session tidak valid'));
      return;
    }

    emit(ProfileLoading());
    try {
      // 1. Update ke Supabase tabel profiles
      await Supabase.instance.client.from('profiles').upsert({
        'id': user.id,
        'full_name': name,
        'username': username,
      });

      // 2. Update Auth Metadata
      await Supabase.instance.client.auth.updateUser(
        UserAttributes(
          data: {
            'name': name,
            'username': username,
          },
        ),
      );

      // 3. Update State Lokal di AuthCubit supaya seluruh aplikasi (Home/Profile) ikut ke-update
      authCubit.updateUserLocally(name: name, username: username);

      emit(ProfileSuccess('Profil berhasil diperbarui'));
    } catch (e) {
      print('Error updating profile: $e');
      emit(ProfileError('Gagal memperbarui profil: $e'));
    }
  }
}
