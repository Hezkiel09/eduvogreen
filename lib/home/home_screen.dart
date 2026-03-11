import 'package:flutter/material.dart';
import 'widgets/home_header.dart';
import 'widgets/home_stats_card.dart';
import 'widgets/volunteer_card.dart';
import 'widgets/article_card.dart';
import 'widgets/home_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // data dummy volunteers
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

    // dummy article
    final articles = [
      {
        'title': 'Dampak Pemanasan Global terhadap Perubahan Cuaca',
        'date': '28 Februari 2026',
        'author': 'Abdul',
        'image': 'assets/article1.jpg',
        'tag': 'Reboisasi',
      },
      {
        'title': 'Cara Mengurangi Sampah Plastik dari Rumah',
        'date': '25 Februari 2026',
        'author': 'Joko',
        'image': 'assets/article2.jpg',
        'tag': 'Edukasi',
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
                  const HomeHeader(
                    userName: 'Joko',
                    avatarAsset: 'assets/profile_default.jpg',
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
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
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

                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: articles.length,

                    separatorBuilder: (_, __) => const SizedBox(height: 12),

                    itemBuilder: (context, index) {
                      final item = articles[index];
                      return ArticleCard(
                        title: item['title']!,
                        date: item['date']!,
                        author: item['author']!,
                        imageAsset: item['image']!,
                        tag: item['tag']!,
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
