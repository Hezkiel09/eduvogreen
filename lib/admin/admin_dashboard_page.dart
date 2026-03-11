import 'package:flutter/material.dart';

import 'widgets/menu_card.dart';
import 'widgets/stat_card.dart';

import 'tambah_artikel_page.dart';
import 'tinjau_artikel_page.dart';
import 'unggah_volunteer_page.dart';
import 'laporan_masalah_page.dart';

class AdminDashboardPage extends StatelessWidget {
  final String adminName;

  const AdminDashboardPage({super.key, this.adminName = "Admin"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER
            Stack(
              clipBehavior: Clip.none,
              children: [
                /// HEADER BACKGROUND
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/admin/header_admin.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// TEXT HEADER
                Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "Halo Admin! $adminName",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "EduvoGreen",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),

                /// STAT CARD (MENIMPA HEADER)
                Positioned(
                  bottom: -60,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      StatCard(
                        number: "12",
                        title: "Volunteer telah \ndiupload",
                        icon: "assets/icons/volup.png",
                      ),
                      StatCard(
                        number: "08",
                        title: "Artikel di \nProses",
                        icon: "assets/icons/arpro.png",
                      ),
                      StatCard(
                        number: "07",
                        title: "Laporan di \nTinjau",
                        icon: "assets/icons/latin.png",
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),

            /// MENU
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  MenuCard(
                    title: "Tambah Artikel",
                    image: "assets/admin/tambahA.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TambahArtikelPage(),
                        ),
                      );
                    },
                  ),

                  MenuCard(
                    title: "Tinjau Artikel User",
                    image: "assets/admin/tinjauA.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TinjauArtikelPage(),
                        ),
                      );
                    },
                  ),

                  MenuCard(
                    title: "Unggah Volunteer",
                    image: "assets/admin/unggahA.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UnggahVolunteerPage(),
                        ),
                      );
                    },
                  ),

                  MenuCard(
                    title: "Laporan Masalah",
                    image: "assets/admin/laporA.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LaporanMasalahPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),

            /// FOOTER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage("assets/logo_eduvogreen.png"),
                  height: 35,
                ),
                SizedBox(width: 10),
                Text(
                  "Copyright EduvoGreen 2026",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
