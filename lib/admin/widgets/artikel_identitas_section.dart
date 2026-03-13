import 'package:flutter/material.dart';

class ArtikelIdentitasSection extends StatelessWidget {
  final TextEditingController judulController;
  final String? kategori;
  final Function(String?) onKategoriChanged;

  const ArtikelIdentitasSection({
    super.key,
    required this.judulController,
    required this.kategori,
    required this.onKategoriChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Judul Artikel *"),

          const SizedBox(height: 8),

          TextField(
            controller: judulController,
            maxLength: 100,
            decoration: InputDecoration(
              hintText: "Masukkan judul artikel",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              counterText: "",
            ),
          ),

          const SizedBox(height: 4),

          Text(
            "${judulController.text.length}/100",
            style: const TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 16),

          const Text("Kategori *"),

          const SizedBox(height: 8),

          DropdownButtonFormField<String>(
            value: kategori,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: "Reboisasi dan penanaman pohon",
                child: Text("Reboisasi dan penanaman pohon"),
              ),
              DropdownMenuItem(
                value: "Pelatihan relawan",
                child: Text("Pelatihan relawan"),
              ),
              DropdownMenuItem(
                value: "Pengelolaan sampah 3R",
                child: Text("Pengelolaan sampah 3R"),
              ),
              DropdownMenuItem(
                value: "Peserta edukasi/kampanye",
                child: Text("Peserta edukasi/kampanye"),
              ),
              DropdownMenuItem(
                value: "Konservasu lingkungan",
                child: Text("Konservasu lingkungan"),
              ),
            ],
            onChanged: onKategoriChanged,
          ),
        ],
      ),
    );
  }
}
