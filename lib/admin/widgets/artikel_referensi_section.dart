import 'package:flutter/material.dart';

class ArtikelReferensiSection extends StatefulWidget {
  final List<TextEditingController> referensiControllers;
  final TextEditingController youtubeController;

  const ArtikelReferensiSection({
    super.key,
    required this.referensiControllers,
    required this.youtubeController,
  });

  @override
  State<ArtikelReferensiSection> createState() =>
      _ArtikelReferensiSectionState();
}

class _ArtikelReferensiSectionState extends State<ArtikelReferensiSection> {
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
          /// HEADER
          const Row(
            children: [
              Icon(Icons.menu_book_outlined, color: Color(0xff2E7D32)),
              SizedBox(width: 10),
              Text(
                "Referensi dan Lampiran",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// LABEL REFERENSI
          const Text("Sumber Referensi *", style: TextStyle(fontSize: 16)),

          const SizedBox(height: 10),

          /// MULTI REFERENSI
          ...widget.referensiControllers.map((controller) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Masukkan link referensi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            );
          }),

          /// TAMBAH REFERENSI
          GestureDetector(
            onTap: () {
              setState(() {
                widget.referensiControllers.add(TextEditingController());
              });
            },
            child: const Text(
              "+ Tambah Referensi",
              style: TextStyle(
                color: Color(0xff2E7D32),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// LINK OPTIONAL
          const Text(
            "Link Video YouTube / Link Gambar (Opsional)",
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: widget.youtubeController,
            decoration: InputDecoration(
              hintText: "https://...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
