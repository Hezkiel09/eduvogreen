import 'package:flutter/material.dart';
import 'widgets/article_list_card.dart';

class EduHubScreen extends StatelessWidget {
  const EduHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final articles = [
      {
        'category': 'Reboisasi',
        'title': 'Mengembalikan Napas Pesisir: Peran Mangrove Menahan Abrasi',
        'preview':
            'Ekosistem mangrove menjadi benteng utama pertahanan daratan dari ancaman krisis iklim.',
        'author': 'Antonio Ngarusolo',
        'date': '3 Maret 2026',
        'image': 'assets/article1.jpg',
      },
      {
        'category': 'Pengelolaan sampah 3R',
        'title': 'Memulai Gaya Hidup Zero Waste dengan Prinsip 3R di Rumah',
        'preview':
            'Kurangi jejak karbon dengan mulai menerapkan prinsip 3R dalam rutinitas harian.',
        'author': 'Admin',
        'date': '3 Maret 2026',
        'image': 'assets/article2.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF148A43),
        onPressed: () {
          Navigator.pushNamed(context, '/add-article');
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF148A43),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: 'EduHub',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism_outlined),
            activeIcon: Icon(Icons.volunteer_activism),
            label: 'Volunteer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            // lagi di eduhub, jadi ga ngapa-ngapain
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/volunteer');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/home-bg.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.22),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Edukasi',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Pelajari dan pahami wawasan\ntentang lingkungan!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText:
                              'Cari artikel atau topik yang sesuai dengan minat mu!',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black45,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: articles.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
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
                    child: ArticleListCard(
                      category: item['category']!,
                      title: item['title']!,
                      preview: item['preview']!,
                      author: item['author']!,
                      date: item['date']!,
                      imageAsset: item['image']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
