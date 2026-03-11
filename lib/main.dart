import 'package:eduvogreen/auth/login_screen.dart';
import 'package:eduvogreen/auth/minat.dart';
import 'package:eduvogreen/auth/register_screen.dart';
import 'package:eduvogreen/core/supabase_client.dart';
import 'package:eduvogreen/eduhub/eduhub_screen.dart';
import 'package:eduvogreen/eduhub/widgets/article_detail_screen.dart';
import 'package:eduvogreen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eduvogreen/eduhub/widgets/add_article_screen.dart';
import 'package:eduvogreen/profile/profile_screen.dart';
import 'package:eduvogreen/eduhub/services/article_service.dart';
import 'package:eduvogreen/eduhub/cubit/article_cubit.dart';

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
      initialRoute: '/home',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/minat': (context) => const MinatScreen(),
        // Wrap EduHubScreen and AddArticleScreen with providers
        '/eduhub': (context) => MultiRepositoryProvider(
              providers: [
                RepositoryProvider<ArticleService>(
                  create: (context) => ArticleService(),
                ),
              ],
              child: BlocProvider<ArticleCubit>(
                create: (context) => ArticleCubit(context.read<ArticleService>()),
                child: const EduHubScreen(),
              ),
            ),
        '/article-detail': (context) => const ArticleDetailScreen(),
        '/add-article': (context) => MultiRepositoryProvider(
              providers: [
                RepositoryProvider<ArticleService>(
                  create: (context) => ArticleService(),
                ),
              ],
              child: BlocProvider<ArticleCubit>(
                create: (context) => ArticleCubit(context.read<ArticleService>()),
                child: const AddArticleScreen(),
              ),
            ),
        '/volunteer': (context) =>
            const Scaffold(body: Center(child: Text('Volunteer'))),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
