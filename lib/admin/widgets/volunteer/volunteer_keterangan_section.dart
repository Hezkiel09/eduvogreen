import 'package:flutter/material.dart';

class VolunteerKeteranganSection extends StatefulWidget {
  final TextEditingController deskripsiController;
  final TextEditingController kriteriaController;

  const VolunteerKeteranganSection({
    super.key,
    required this.deskripsiController,
    required this.kriteriaController,
  });

  @override
  State<VolunteerKeteranganSection> createState() =>
      _VolunteerKeteranganSectionState();
}

class _VolunteerKeteranganSectionState
    extends State<VolunteerKeteranganSection> {
  final benefitControllers = [TextEditingController()];

  Widget area(String label, TextEditingController controller, {String? hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }

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
              Icon(Icons.notes, color: Color(0xff2E7D32)),
              SizedBox(width: 10),
              Text(
                "Keterangan Kegiatan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ],
          ),

          const SizedBox(height: 20),

          area(
            "Deskripsi Kegiatan",
            widget.deskripsiController,
            hint: "Tuliskan Deskripsi Singkat",
          ),

          area(
            "Kriteria Peserta",
            widget.kriteriaController,
            hint: "Tuliskan Kriteria Peserta",
          ),

          const Text("Benefit"),

          const SizedBox(height: 8),

          ...benefitControllers.map((controller) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.school,
                    color: Color(0xff2E7D32),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            );
          }),

          GestureDetector(
            onTap: () {
              setState(() {
                benefitControllers.add(TextEditingController());
              });
            },
            child: const Text(
              "+ Tambah Benefit",
              style: TextStyle(color: Color(0xff2E7D32)),
            ),
          ),
        ],
      ),
    );
  }
}
