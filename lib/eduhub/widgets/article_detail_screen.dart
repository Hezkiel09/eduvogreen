import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ambil data yang dikirim dari halaman list
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final category = args?['category'] ?? 'Climate Action';
    final title =
        args?['title'] ??
        'Mengembalikan Napas Pesisir: Peran Mangrove Menahan Abrasi';
    final author = args?['author'] ?? 'Antonio Ngarusolo';
    final date = args?['date'] ?? '3 Maret 2026';
    final imageAsset = args?['image'] ?? 'assets/article1.jpg';

    // nanti ini bisa dihitung otomatis dari jumlah kata
    final readingTime = args?['readingTime'] ?? '5 menit baca';

    // dummy isi artikel dulu, nanti diganti dari backend
    const articleContent = '''
Ekosistem mangrove memiliki peran yang sangat penting dalam menjaga wilayah pesisir dari ancaman abrasi, gelombang tinggi, dan dampak perubahan iklim. Akar mangrove yang rapat mampu menahan sedimen dan memperlambat laju erosi tanah di tepi pantai.

Selain berfungsi sebagai pelindung alami, mangrove juga menjadi habitat bagi berbagai jenis biota seperti ikan, kepiting, burung, dan organisme laut lainnya. Kehadiran hutan mangrove membuat rantai ekosistem pesisir tetap seimbang dan produktif.

Di tengah meningkatnya ancaman krisis iklim, penanaman dan restorasi mangrove menjadi salah satu solusi berbasis alam yang sangat efektif. Mangrove dapat menyerap karbon dalam jumlah besar, bahkan lebih tinggi dibandingkan banyak jenis vegetasi daratan lainnya.

Sayangnya, alih fungsi lahan, pencemaran, dan pembangunan yang tidak terkendali menyebabkan kawasan mangrove semakin berkurang. Karena itu, keterlibatan masyarakat, komunitas, dan generasi muda menjadi sangat penting dalam menjaga dan memulihkan ekosistem ini.

Melalui edukasi, aksi lapangan, dan kolaborasi berbagai pihak, mangrove bisa kembali menjadi benteng alami yang kuat bagi wilayah pesisir Indonesia. Menjaga mangrove berarti menjaga masa depan lingkungan dan kehidupan masyarakat pesisir.
''';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App bar custom
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const Expanded(
                    child: Text(
                      'Detail Artikel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // kategori
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4FA057),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // judul
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        height: 1.25,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // metadata
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        _MetaItem(
                          icon: Icons.account_circle_outlined,
                          text: author,
                        ),
                        _MetaItem(
                          icon: Icons.calendar_today_outlined,
                          text: date,
                        ),
                        _MetaItem(
                          icon: Icons.schedule_outlined,
                          text: readingTime,
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // gambar utama
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        imageAsset,
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return Container(
                            width: double.infinity,
                            height: 220,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.image,
                              size: 42,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 18),

                    // action buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Artikel disimpan'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.bookmark_border),
                            label: const Text('Simpan'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF148A43),
                              side: const BorderSide(color: Color(0xFF148A43)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              _showReportDialog(context);
                            },
                            icon: const Icon(Icons.flag_outlined),
                            label: const Text('Laporkan'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.redAccent,
                              side: const BorderSide(color: Colors.redAccent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // isi artikel
                    const Text(
                      'Isi Artikel',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      articleContent,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.7,
                        color: Color(0xFF333333),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // referensi
                    const Text(
                      'Referensi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Text(
                        '1. Kementerian Lingkungan Hidup dan Kehutanan. Restorasi Ekosistem Mangrove.\n'
                        '2. Badan Riset dan Inovasi Nasional. Peran Mangrove dalam Menyerap Karbon.',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _showReportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        String selectedReason = 'Informasi menyesatkan';

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              title: const Text('Laporkan Artikel'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    value: 'Informasi menyesatkan',
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() => selectedReason = value!);
                    },
                    title: const Text('Informasi menyesatkan'),
                  ),
                  RadioListTile<String>(
                    value: 'Konten tidak relevan',
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() => selectedReason = value!);
                    },
                    title: const Text('Konten tidak relevan'),
                  ),
                  RadioListTile<String>(
                    value: 'Lainnya',
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() => selectedReason = value!);
                    },
                    title: const Text('Lainnya'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Batal'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF148A43),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Laporan berhasil dikirim'),
                      ),
                    );
                  },
                  child: const Text('Kirim'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _MetaItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MetaItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: Colors.black54),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}