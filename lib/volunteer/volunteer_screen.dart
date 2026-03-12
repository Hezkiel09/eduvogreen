import 'package:flutter/material.dart';
import 'volunteer_model.dart';
import 'widgets/volunteer_card.dart';
import 'widgets/volunteer_tabs.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({super.key});

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  int selectedTab = 0;

  List<VolunteerEvent> events = [
    VolunteerEvent(
      title: "Penanaman 100 Pohon Mangrove",
      category: "Reboisasi",
      activity: "Aksi Lingkungan",
      location: "Pantai Indah Kapuk, Jakarta",
      date: "19 Maret 2026",
      time: "09:00 - 17:00",
      image: "assets/event1.png",
      organizer: "Dinas Lingkungan Hidup Jakarta",
      organizerLogo: "assets/org1.png",
      description:
          "Kegiatan penanaman 100 pohon mangrove ini bertujuan untuk"
          "membantu mengurangi abrasi pantai serta menjaga keseimbangan ekosistem pesisir."
          "Peserta akan dibimbing oleh tim konservasi lokal untuk memahami teknik penanaman"
          "yang benar dan pentingnya mangrove bagi lingkungan serta masyarakat sekitar.",
      currentParticipants: 45,
      maxParticipants: 50,
      criteria: [
        "Terbuka untuk umum (minimal usia 13 tahun)",
        "Sehat jasmani dan rohani",
        "Bersedia mengikuti kegiatan hingga selesai",
        "Membawa topi & botol minum pribadi",
      ],

      benefits: [
        Benefit(
          title: "Sertifikat partisipasi",
          icon: "assets/icons/certificate.png",
        ),
        Benefit(title: "Edukasi", icon: "assets/icons/education.png"),
        Benefit(title: "Snack & air mineral", icon: "assets/icons/snack.png"),
        Benefit(title: "Dokumentasi", icon: "assets/icons/documentation.png"),
        Benefit(title: "Pengalaman", icon: "assets/icons/experience.png"),
        Benefit(title: "Kaos & merch", icon: "assets/icons/shirt.png"),
      ],
      isOpen: true,
    ),

    VolunteerEvent(
      title: "Pemberian Edukasi ke Sekolah-Sekolah",
      category: "Pemberian Edukasi",
      activity: "Edukasi Pembelajaran",
      location: "SMP Negeri 5 Bandung",
      date: "23 Maret 2026",
      time: "08:00 - 12:00",
      image: "assets/event2.png",
      organizer: "Dinas Lingkungan Hidup Bandung",
      organizerLogo: "assets/org2.png",
      description:
          "Gerakan menanam pohon untuk meningkatkan kualitas udara dan lingkungan.",
      currentParticipants: 20,
      maxParticipants: 30,
      criteria: [
        "Terbuka untuk umum (minimal usia 20 tahun)",
        "Menyukai kegiatan alam",
        "Bersedia bekerja dalam tim",
      ],

      benefits: [
        Benefit(
          title: "Sertifikat partisipasi",
          icon: "assets/icons/certificate.png",
        ),
        Benefit(title: "Edukasi", icon: "assets/icons/education.png"),
        Benefit(title: "Snack & air mineral", icon: "assets/icons/snack.png"),
        Benefit(title: "Dokumentasi", icon: "assets/icons/documentation.png"),
        Benefit(title: "Pengalaman", icon: "assets/icons/experience.png"),
        Benefit(title: "Kaos & merch", icon: "assets/icons/shirt.png"),
      ],
      isOpen: true,
    ),

    VolunteerEvent(
      title: "Mengajar Anak Desa",
      category: "Pendidikan",
      activity: "Edukasi Pembelajaran",
      location: "SDN 12 Kabupaten Malang",
      date: "20 Januari 2026",
      time: "09:00 - 11:00",
      image: "assets/event3.png",
      organizer: "EduCare",
      organizerLogo: "assets/org3.png",
      description:
          "Program relawan pendidikan untuk membantu anak-anak desa mendapatkan pendidikan dasar.",
      currentParticipants: 10,
      maxParticipants: 15,
      criteria: [
        "Sabar dan ramah",
        "Suka mengajar anak-anak",
        "Minimal usia 18 tahun",
      ],

      benefits: [
        Benefit(
          title: "Sertifikat partisipasi",
          icon: "assets/icons/certificate.png",
        ),
        Benefit(title: "Edukasi", icon: "assets/icons/education.png"),
        Benefit(title: "Snack & air mineral", icon: "assets/icons/snack.png"),
        Benefit(title: "Dokumentasi", icon: "assets/icons/documentation.png"),
        Benefit(title: "Pengalaman", icon: "assets/icons/experience.png"),
        Benefit(title: "Kaos & merch", icon: "assets/icons/shirt.png"),
      ],
      isOpen: true,
    ),

    VolunteerEvent(
      title: "Kesehatan Lingkungan",
      category: "Kesehatan",
      activity: "Kegiatan dengan Korea Selatan",
      location: "Medan",
      date: "12 Desember 2026",
      time: "08:00 - 15:00",
      image: "assets/event4.png",
      organizer: "PMI",
      organizerLogo: "assets/org4.png",
      description:
          "Kegiatan relawan kesehatan lingkungan bekerja sama dengan tim dari Korea Selatan"
          "untuk meningkatkan kesadaran tentang pentingnya menjaga kebersihan lingkungan"
          "dan mencegah penyakit yang ditularkan melalui lingkungan.",
      currentParticipants: 0,
      maxParticipants: 100,
      criteria: [
        "Usia 18-55 tahun",
        "Sehat jasmani",
        "Tidak memiliki riwayat penyakit tertentu",
        "Bersedia mengikuti pelatihan kesehatan lingkungan",
        "Bersedia bekerja di luar ruangan",
      ],

      benefits: [
        Benefit(
          title: "Sertifikat partisipasi",
          icon: "assets/icons/certificate.png",
        ),
        Benefit(title: "Edukasi", icon: "assets/icons/education.png"),
        Benefit(title: "Snack & air mineral", icon: "assets/icons/snack.png"),
        Benefit(title: "Dokumentasi", icon: "assets/icons/documentation.png"),
        Benefit(title: "Pengalaman", icon: "assets/icons/experience.png"),
        Benefit(title: "Kaos & merch", icon: "assets/icons/shirt.png"),
      ],
      isOpen: false,
    ),

    VolunteerEvent(
      title: "Relawan Banjir",
      category: "Kemanusiaan",
      activity: "Membersihkan Sungai",
      location: "Semarang",
      date: "20 Mei 2027",
      time: "07:00 - 15:00",
      image: "assets/event5.png",
      organizer: "Human Care",
      organizerLogo: "assets/org5.png",
      description: "Program relawan untuk membantu korban bencana banjir.",
      currentParticipants: 0,
      maxParticipants: 80,
      criteria: [
        "Fisik kuat",
        "Siap bekerja di lapangan",
        "Bersedia mengikuti arahan tim",
        "Bersedia bekerja dalam kondisi basah dan kotor",
      ],

      benefits: [
        Benefit(
          title: "Sertifikat partisipasi",
          icon: "assets/icons/certificate.png",
        ),
        Benefit(title: "Edukasi", icon: "assets/icons/education.png"),
        Benefit(title: "Snack & air mineral", icon: "assets/icons/snack.png"),
        Benefit(title: "Dokumentasi", icon: "assets/icons/documentation.png"),
        Benefit(title: "Pengalaman", icon: "assets/icons/experience.png"),
        Benefit(title: "Kaos & merch", icon: "assets/icons/shirt.png"),
      ],
      isOpen: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<VolunteerEvent> open = events.where((e) => e.isOpen).toList();

    List<VolunteerEvent> upcoming = events.where((e) => !e.isOpen).toList();

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "assets/BG.png",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(height: 180, color: Colors.black.withOpacity(0.35)),

                const Positioned(
                  top: 45,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "Volunteer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Temukan kegiatan volunteer yang \nsesuai dengan minat Anda",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Transform.translate(
            offset: const Offset(0, -20),
            child: VolunteerTabs(
              selectedTab: selectedTab,
              onTap: (i) {
                setState(() {
                  selectedTab = i;
                });
              },
            ),
          ),

          const SizedBox(height: 0),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: (selectedTab == 0 ? open : upcoming)
                  .map(
                    (e) => VolunteerCard(
                      event: e,
                      onUpdate: () {
                        setState(() {});
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "EduHub"),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: "Volunteer",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
