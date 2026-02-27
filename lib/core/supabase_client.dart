import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://jhykwykwnlefxbsaefpj.supabase.co',
      anonKey: 'sb_publishable_mSE0ltfhSxKmIv6cHpRPvw_qf-iw5zX',
    );
  }
}
