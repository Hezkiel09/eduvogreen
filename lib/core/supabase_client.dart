import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://jhykwykwnlefxbsaefpj.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpoeWt3eWt3bmxlZnhic2FlZnBqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzIwMjg1NzYsImV4cCI6MjA4NzYwNDU3Nn0.u8HJyg8LJGdCSfNEAAJeX8dTtIV8CEI7oH_BbgxYGEY',
    );
  }
}
