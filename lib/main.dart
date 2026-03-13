import 'package:eduvogreen/core/supabase_client.dart';
import 'package:eduvogreen/core/app_providers.dart';
import 'package:eduvogreen/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseConfig.init();

  final uri = Uri.base;
  String initialRoute = AppRoutes.login;

  if (uri.path == '/reset-password') {
    initialRoute = AppRoutes.resetPassword;

    final fragment = uri.fragment;

    if (fragment.contains('refresh_token')) {
      final params = Uri.splitQueryString(fragment);

      final refreshToken = params['refresh_token'];

      if (refreshToken != null) {
        await Supabase.instance.client.auth.setSession(refreshToken);
      }
    }
  }

  Supabase.instance.client.auth.onAuthStateChange.listen((data) {
    final event = data.event;

    if (event == AuthChangeEvent.passwordRecovery) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigatorKey.currentState?.pushReplacementNamed(
          AppRoutes.resetPassword,
        );
      });
    }
  });

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'EduVoGreen',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        initialRoute: initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
