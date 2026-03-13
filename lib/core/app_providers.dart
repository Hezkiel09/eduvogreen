import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eduvogreen/eduhub/services/article_service.dart';
import 'package:eduvogreen/eduhub/cubit/article_cubit.dart';
import 'package:eduvogreen/cubit/auth_cubit.dart';
import 'package:eduvogreen/profile/cubit/profile_cubit.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ArticleService>(
          create: (context) => ArticleService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
          ),
          BlocProvider<ProfileCubit>(
            create: (context) =>
                ProfileCubit(authCubit: context.read<AuthCubit>()),
          ),
          BlocProvider<ArticleCubit>(
            create: (context) => ArticleCubit(context.read<ArticleService>()),
          ),
        ],
        child: child,
      ),
    );
  }
}
