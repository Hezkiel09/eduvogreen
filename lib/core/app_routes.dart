import 'package:eduvogreen/auth/login_screen.dart';
import 'package:eduvogreen/auth/minat.dart';
import 'package:eduvogreen/auth/register_screen.dart';
import 'package:eduvogreen/auth/forgot_password_screen.dart';
import 'package:eduvogreen/auth/reset_password_screen.dart';

import 'package:eduvogreen/eduhub/eduhub_screen.dart';
import 'package:eduvogreen/eduhub/widgets/article_detail_screen.dart';
import 'package:eduvogreen/eduhub/widgets/add_article_screen.dart';
import 'package:eduvogreen/home/home_screen.dart';
import 'package:eduvogreen/profile/profile_screen.dart';
import 'package:eduvogreen/profile/widgets/edit_profile_screen.dart';
import 'package:eduvogreen/eduhub/widgets/saved_articles_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String minat = '/minat';
  static const String eduhub = '/eduhub';
  static const String articleDetail = '/article-detail';
  static const String addArticle = '/add-article';
  static const String volunteer = '/volunteer';
  static const String profile = '/profile';
  static const String savedArticles = '/saved-articles';
  static const String editProfile = '/edit-profile';

  static Map<String, WidgetBuilder> get routes => {
        login: (context) => const LoginScreen(),
        register: (context) => const RegisterScreen(),
        home: (context) => const HomeScreen(),
        minat: (context) => const MinatScreen(),
        eduhub: (context) => const EduHubScreen(),
        articleDetail: (context) => const ArticleDetailScreen(),
        addArticle: (context) => const AddArticleScreen(),
        volunteer: (context) =>
            const Scaffold(body: Center(child: Text('Volunteer'))),
        profile: (context) => const ProfileScreen(),
        savedArticles: (context) => const SavedArticlesScreen(),
        editProfile: (context) => const EditProfileScreen(),
      };
}
