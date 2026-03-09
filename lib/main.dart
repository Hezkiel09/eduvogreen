import 'package:eduvogreen/auth/login_screen.dart';
import 'package:eduvogreen/auth/minat.dart';
import 'package:eduvogreen/auth/register_screen.dart';
import 'package:eduvogreen/core/supabase_client.dart';
import 'package:eduvogreen/eduhub/eduhub_screen.dart';
import 'package:eduvogreen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:eduvogreen/eduhub/eduhub_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduVoGreen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/minat': (context) => const MinatScreen(),
        '/eduhub': (context) => const EduHubScreen(),
        '/article-detail': (context) =>
            const Scaffold(body: Center(child: Text('Article Detail'))),
        '/add-article': (context) =>
            const Scaffold(body: Center(child: Text('Add Article'))),
        '/volunteer': (context) =>
            const Scaffold(body: Center(child: Text('Volunteer'))),
        '/profile': (context) =>
            const Scaffold(body: Center(child: Text('Profile'))),
      },
    );
  }
}
