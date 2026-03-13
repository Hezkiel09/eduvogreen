import 'package:eduvogreen/auth/login_screen.dart';
import 'package:eduvogreen/auth/minat.dart';
import 'package:eduvogreen/auth/register_screen.dart';
import 'package:eduvogreen/core/supabase_client.dart';
import 'package:eduvogreen/cubit/auth_cubit.dart';
import 'package:eduvogreen/home/home_screen.dart';
import 'package:eduvogreen/volunteer/volunteer_screen.dart';
import 'package:eduvogreen/admin/admin_dashboard_page.dart';
import 'package:eduvogreen/auth/reset_password_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EduVoGreen',

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          scaffoldBackgroundColor: Colors.white,
        ),

        initialRoute: '/volunteer',

        routes: {
          '/login': (_) => const LoginScreen(),
          '/register': (_) => const RegisterScreen(),
          '/home': (_) => const HomeScreen(),
          '/minat': (_) => const MinatScreen(),
          '/volunteer': (_) => const VolunteerScreen(),
          '/reset_password': (_) => const ResetPasswordScreen(),

          '/admin': (_) => const AdminDashboardPage(
                adminName: "Admin",
              ),
        },
      ),
    );
  }
}