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
    "Peserta edukasi/kampanye",
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
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    const Text(
                      "Apa yang Anda Minati?",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Pilih topik yang Anda sukai untuk mendapatkan \nrekomendasi yang lebih baik",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),

                    const SizedBox(height: 32),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: minatList.map((item) {
                            final bool isSelected = selectedMinat.contains(
                              item,
                            );

                            return GestureDetector(
                              onTap: () => toggleMinat(item),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFF4ADE80)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFF4ADE80)
                                        : Colors.grey.shade400,
                                  ),
                                ),
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF525252),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.translate(
                        offset: const Offset(-25, 0),
                        child: Image.asset(
                          'assets/minat.png',
                          height: 320,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),

            // BUTTON SECTION
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.black, width: 1),
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isButtonEnabled ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled
                        ? const Color(0xFF188C42)
                        : Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Lanjutkan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
