import 'package:eduvogreen/core/supabase_client.dart';
import 'package:eduvogreen/core/app_providers.dart';
import 'package:eduvogreen/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.init();
  // cek session

  final session = Supabase.instance.client.auth.currentSession;
  final isLoggedIn = session != null;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp(
        title: 'EduVoGreen',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: isLoggedIn ? AppRoutes.home : AppRoutes.login,
        routes: AppRoutes.routes,
      ),
    );
  }
}
