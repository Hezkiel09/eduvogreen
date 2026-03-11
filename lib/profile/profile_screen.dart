import 'package:flutter/material.dart';
import '../home/widgets/home_bottom_nav.dart';
import 'widgets/profile_menu_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      bottomNavigationBar: const HomeBottomNav(currentIndex: 3),

      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline),
                      SizedBox(width: 8),
                      Text(
                        'Profil',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Kelola informasi akun anda',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    // FOTO PROFIL
                    const CircleAvatar(
                      radius: 46,
                      backgroundImage: AssetImage('assets/profile_default.jpg'),
                    ),

                    const SizedBox(height: 12),

                    // NAMA
                    const Text(
                      'Joko Anwar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // USERNAME
                    const Text(
                      '@jokokun_67',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),

                    const SizedBox(height: 4),

                    // EMAIL
                    const Text(
                      'jokoanwar786@gmail.com',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),

                    const SizedBox(height: 24),

                    // MENU LIST
                    ProfileMenuTile(
                      icon: Icons.edit_outlined,
                      title: 'Edit Profil',
                      subtitle: 'Ubah nama dan email',
                      onTap: () {
                        Navigator.pushNamed(context, '/edit-profile');
                      },
                    ),

                    ProfileMenuTile(
                      icon: Icons.lock_outline,
                      title: 'Ubah Password',
                      subtitle: 'Perbarui kata sandi',
                      onTap: () {
                        Navigator.pushNamed(context, '/change-password');
                      },
                    ),

                    ProfileMenuTile(
                      icon: Icons.article_outlined,
                      title: 'Artikel Saya',
                      subtitle: 'Lihat artikel yang sudah kamu tulis',
                      onTap: () {
                        Navigator.pushNamed(context, '/my-articles');
                      },
                    ),

                    ProfileMenuTile(
                      icon: Icons.bookmark_border,
                      title: 'Artikel Disimpan',
                      subtitle: 'Lihat artikel yang kamu simpan',
                      onTap: () {
                        Navigator.pushNamed(context, '/saved-articles');
                      },
                    ),

                    ProfileMenuTile(
                      icon: Icons.volunteer_activism_outlined,
                      title: 'Volunteer Disimpan',
                      subtitle: 'Lihat volunteer yang kamu simpan',
                      onTap: () {
                        Navigator.pushNamed(context, '/saved-volunteer');
                      },
                    ),

                    ProfileMenuTile(
                      icon: Icons.flag_outlined,
                      title: 'Laporan Saya',
                      subtitle: 'Lihat status laporan kamu',
                      onTap: () {
                        Navigator.pushNamed(context, '/reports');
                      },
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
