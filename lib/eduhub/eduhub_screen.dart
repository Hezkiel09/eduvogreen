import 'package:flutter/material.dart';
import '../home/widgets/home_bottom_nav.dart';
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
        'content':
            'Indonesia, sebagai negara kepulauan terbesar di dunia dengan garis pantai mencapai lebih dari 99.000 kilometer, kini berdiri di garis depan menghadapi ancaman krisis iklim. Peningkatan suhu bumi telah memicu pelelehan es di kutub secara masif, yang berdampak langsung pada kenaikan permukaan air laut secara global. Garis pantai yang terus tergerus ombak bukan lagi sekadar ancaman di atas kertas, melainkan realitas pahit yang sedang terjadi.\n\nFenomena abrasi ini tidak hanya mengancam pemukiman warga pesisir yang terpaksa mundur setiap tahunnya, tetapi juga merusak infrastruktur vital, fasilitas umum, dan area tambak yang menjadi urat nadi perekonomian lokal. Di tengah krisis ekologis yang mendesak ini, ekosistem hutan mangrove hadir sebagai pahlawan tanpa tanda jasa—sebuah benteng pertahanan alami yang terbukti paling efektif, murah, dan berkelanjutan dibandingkan pembangunan tanggul beton buatan manusia.\n\nLebih dari Sekadar Sabuk Hijau\nBanyak yang mengira mangrove hanyalah kumpulan pohon yang tumbuh di lumpur. Padahal, anatomi tanaman ini adalah mahakarya evolusi.',
      },
      {
        'category': 'Pengelolaan sampah 3R',
        'title': 'Memulai Gaya Hidup Zero Waste dengan Prinsip 3R di Rumah',
        'preview':
            'Kurangi jejak karbon dengan mulai menerapkan prinsip 3R dalam rutinitas harian.',
        'author': 'Admin',
        'date': '3 Maret 2026',
        'image': 'assets/article2.jpg',
        'content':
            'Prinsip 3R (Reduce, Reuse, Recycle) sangat penting diterapkan dalam kehidupan sehari-hari untuk meminimalisir sampah. Langkah kecil dari rumah bisa memberikan dampak besar bagi kelestarian lingkungan kita bersama.',
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

      bottomNavigationBar: const HomeBottomNav(currentIndex: 1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/BG.png'),
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

                    // search bar
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                        decoration: InputDecoration(
                          hintText:
                              'Cari artikel atau topik yang sesuai dengan minatmu!',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black38,
                          ),
                          // prefixIcon: Icon(
                          //   Icons.search,
                          //   color: Colors.black45,
                          //   size: 20,
                          // ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black45,
                            size: 18,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
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
                // DIUBAH: padding bawah ditambah supaya item terakhir tidak ketabrak FAB/navbar
                padding: const EdgeInsets.fromLTRB(
                  16,
                  0,
                  16,
                  100,
                ), // DIUBAH: sebelumnya horizontal only
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
