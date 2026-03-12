import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VolunteerInformasiAwalSection extends StatefulWidget {
  final TextEditingController judulController;
  final TextEditingController lokasiController;
  final TextEditingController pesertaController;
  final TextEditingController penyelenggaraController;

  const VolunteerInformasiAwalSection({
    super.key,
    required this.judulController,
    required this.lokasiController,
    required this.pesertaController,
    required this.penyelenggaraController,
  });

  @override
  State<VolunteerInformasiAwalSection> createState() =>
      _VolunteerInformasiAwalSectionState();
}

class _VolunteerInformasiAwalSectionState
    extends State<VolunteerInformasiAwalSection> {
  final tanggalController = TextEditingController();
  final mulaiController = TextEditingController();
  final akhirController = TextEditingController();

  final kategoriControllers = [TextEditingController()];

  Future<void> pilihTanggal() async {
    final first = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (first != null) {
      final second = await showDatePicker(
        context: context,
        initialDate: first.add(const Duration(days: 1)),
        firstDate: first,
        lastDate: DateTime(2030),
      );

      if (second != null) {
        tanggalController.text =
            "${first.day} - ${second.day} ${DateFormat('MMMM yyyy').format(second)}";
      }
    }
  }

  Future<void> pilihJam(TextEditingController controller) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();

      final dt = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );

      controller.text = DateFormat("HH.mm").format(dt);
    }
  }

  Widget pickerField(
    String label,
    TextEditingController controller,
    VoidCallback onTap,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),

        const SizedBox(height: 8),

        GestureDetector(
          onTap: onTap,
          child: AbsorbPointer(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
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
          const Row(
            children: [
              Icon(Icons.article_outlined, color: Color(0xff2E7D32)),
              SizedBox(width: 10),
              Text(
                "Informasi Awal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ],
          ),

          const SizedBox(height: 20),

          TextField(
            controller: widget.judulController,
            decoration: const InputDecoration(
              labelText: "Judul Kegiatan",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: widget.lokasiController,
            decoration: const InputDecoration(
              labelText: "Lokasi Kegiatan",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          pickerField("Tanggal Kegiatan", tanggalController, pilihTanggal),

          const Text("Waktu Kegiatan"),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => pilihJam(mulaiController),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: mulaiController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text("-"),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () => pilihJam(akhirController),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: akhirController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          TextField(
            controller: widget.pesertaController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Jumlah Peserta*",
              suffixText: "Peserta",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "*) Hanya angka saja",
            style: TextStyle(color: Colors.brown, fontSize: 12),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: widget.penyelenggaraController,
            decoration: const InputDecoration(
              labelText: "Penyelenggara",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
