import 'package:eduvogreen/auth/login_screen.dart';
import 'package:eduvogreen/core/supabase_client.dart';
import 'package:eduvogreen/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduVoGreen',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: LoginScreen(),
    );
  }
}
