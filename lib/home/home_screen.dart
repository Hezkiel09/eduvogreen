import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_header.dart';
import 'widgets/home_stats_card.dart';
import 'widgets/volunteer_card.dart';
import 'widgets/article_card.dart';
import 'widgets/home_bottom_nav.dart';
import '../eduhub/services/article_service.dart';
import '../eduhub/models/article_model.dart';
import '../cubit/auth_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ArticleService _articleService = ArticleService();
  late Future<List<ArticleModel>> _latestArticlesFuture;

  @override
  void initState() {
    super.initState();
    _latestArticlesFuture = _fetchLatestArticles();
  }

  Future<List<ArticleModel>> _fetchLatestArticles() async {
    final allArticles = await _articleService.getArticles();
    return allArticles.take(2).toList();
  }

  @override
  Widget build(BuildContext context) {
    final volunteers = [
      {
        'title': 'Penanaman 100 Pohon Mangrove',
        'location': 'Pantai Indah Kapuk, Jakarta',
        'date': '19 Maret 2026',
        'image': '',
        'tag': 'Reboisasi',
        'participants': '45/50 Peserta',
      },
      {
        'title': 'Pemberian Edukasi Lingkungan',
        'location': 'SMP Negeri 1 Depok',
        'date': '23 Maret 2026',
        'image': 'assets/volunteer2.jpg',
        'tag': 'Pemberian Edukasi',
        'participants': '32/40 Peserta',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      bottomNavigationBar: const HomeBottomNav(currentIndex: 0),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      String userName = 'Eduvers';
                      String avatar = 'assets/profile_default.jpg';
                      
                      if (state is Success) {
                        userName = state.user.namaPanjang ?? state.user.username;
                        // avatar logic bisa ditambahkan nanti jika ada URL foto profil
                      }
                      
                      return HomeHeader(
                        userName: userName,
                        avatarAsset: avatar,
                      );
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Transform.translate(
                      offset: const Offset(0, -18),
                      child: const HomeStatsCard(),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Rekomendasi Volunteer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4A044E),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 270,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: volunteers.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final item = volunteers[index];
                        return VolunteerCard(
                          title: item['title']!,
                          location: item['location']!,
                          date: item['date']!,
                          imageAsset: item['image']!,
                          tag: item['tag']!,
                          participants: item['participants']!,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Artikel Hari ini',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4A044E),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  FutureBuilder<List<ArticleModel>>(
                    future: _latestArticlesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(color: Color(0xFF148A43)),
                        );
                      }
                      
                      if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Belum ada artikel terbaru.'),
                        );
                      }

                      final articles = snapshot.data!;
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: articles.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final item = articles[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/article-detail',
                                arguments: item,
                              );
                            },
                            child: ArticleCard(
                              title: item.title,
                              date: item.publishDate,
                              author: item.authorName,
                              imageAsset: item.thumbnail,
                              tag: item.category,
                            ),
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
