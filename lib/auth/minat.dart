import 'package:flutter/material.dart';

class MinatScreen extends StatefulWidget {
  const MinatScreen({super.key});

  @override
  State<MinatScreen> createState() => _MinatScreenState();
}

class _MinatScreenState extends State<MinatScreen> {

  final List<String> minatList = [
    "Reboisasi dan penanaman pohon",
    "Pelatihan relawan",
    "Pengelolaan sampah 3R",
    "Peserta edukasi / kampanye",
    "Konservasi dan reboisasi",
    "Kampanye lingkungan",
    "Pemberian edukasi",
    "Aksi membersihkan lingkungan",
  ];

  final Set<String> selectedMinat = {};

  void toggleMinat(String item) {
    setState(() {
      if (selectedMinat.contains(item)) {
        selectedMinat.remove(item);
      } else {
        selectedMinat.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = selectedMinat.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 20),

                    const Text(
                      "Apa yang Anda Minati?",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Pilih topik yang Anda sukai untuk mendapatkan rekomendasi yang lebih baik",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 25),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: minatList.map((item) {
                            final bool isSelected =
                                selectedMinat.contains(item);

                            return GestureDetector(
                              onTap: () => toggleMinat(item),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFF6FCF97)
                                      : Colors.transparent,
                                  borderRadius:
                                      BorderRadius.circular(25),
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFF6FCF97)
                                        : Colors.grey.shade400,
                                  ),
                                ),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // BUTTON SECTION
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                          // lanjut ke halaman berikutnya
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled
                        ? const Color(0xFF4FA057)
                        : Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Lanjutkan",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}