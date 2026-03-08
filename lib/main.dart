import 'package:eduvogreen/auth/login_screen.dart';
import 'package:eduvogreen/auth/minat.dart';
import 'package:eduvogreen/auth/register_screen.dart';
import 'package:eduvogreen/core/supabase_client.dart';
import 'package:eduvogreen/cubit/auth_cubit.dart';
import 'package:eduvogreen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eduvogreen/volunteer/volunteer_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      initialRoute: '/volunteer',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/minat': (context) => const MinatScreen(),
        '/volunteer': (context) => const VolunteerScreen(),
      },
    );
  }
}
