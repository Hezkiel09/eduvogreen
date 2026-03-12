import 'package:flutter/material.dart';

import 'widgets/menu_card.dart';
import 'widgets/stat_card.dart';

import 'tambah_artikel_page.dart';
import 'tinjau_artikel_page.dart';
import 'unggah_volunteer_page.dart';
import 'laporan_masalah_page.dart';

class AdminDashboardPage extends StatefulWidget {
  final String adminName;

  const AdminDashboardPage({super.key, this.adminName = "Admin"});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  int volunteerCount = 0;
  int articleCount = 0;
  int reportCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Stack(
              clipBehavior: Clip.none,
              children: [
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

                Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "Halo Admin! ${widget.adminName}",
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

                // Stat Card
                Positioned(
                  bottom: -60,
                  left: 10,
                  right: 10,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      StatCard(
                        number: volunteerCount.toString().padLeft(2, '0'),
                        title: "Volunteer telah \ndiupload",
                        icon: "assets/icons/volup.png",
                      ),

                      StatCard(
                        number: articleCount.toString().padLeft(2, '0'),
                        title: "Artikel di \nProses",
                        icon: "assets/icons/arpro.png",
                      ),

                      StatCard(
                        number: reportCount.toString().padLeft(2, '0'),
                        title: "Laporan di \nTinjau",
                        icon: "assets/icons/latin.png",
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),

            // Menu
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

                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TambahArtikelPage(adminName: widget.adminName),
                        ),
                      );

                      setState(() {
                        articleCount++;
                      });
                    },
                  ),

                  MenuCard(
                    title: "Tinjau Artikel User",
                    image: "assets/admin/tinjauA.png",

                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TinjauArtikelPage(),
                        ),
                      );

                      setState(() {
                        articleCount++;
                      });
                    },
                  ),

                  MenuCard(
                    title: "Unggah Volunteer",
                    image: "assets/admin/unggahA.png",

                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              UnggahVolunteerPage(adminName: widget.adminName),
                        ),
                      );

                      setState(() {
                        volunteerCount++;
                      });
                    },
                  ),

                  MenuCard(
                    title: "Laporan Masalah",
                    image: "assets/admin/laporA.png",

                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LaporanMasalahPage(),
                        ),
                      );

                      setState(() {
                        reportCount++;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),

            // Footer
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
