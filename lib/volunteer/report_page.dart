import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String? selectedCategory;
  final TextEditingController reasonController = TextEditingController();
  File? imageFile;

  bool isSubmitted = false;

  final List<String> categories = [
    "Reward Tidak Sesuai",
    "Kurangnya Informasi",
    "Indikasi Scam",
    "Kegiatan tidak sesuai",
    "Lainnya",
  ];

  bool get isValid {
    return selectedCategory != null &&
        reasonController.text.isNotEmpty &&
        imageFile != null;
  }

  Future pickImage() async {
    final picker = ImagePicker();

    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked == null) return;

    final file = File(picked.path);

    final size = await file.length();

    if (size > 5 * 1024 * 1024) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ukuran gambar maksimal 5MB")),
      );

      return;
    }

    setState(() {
      imageFile = file;
    });
  }

  void submitReport() {
    if (!isValid) return;

    setState(() {
      isSubmitted = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color(0xff2E7D32),
        content: Text(
          "Laporan telah dikirim",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pop(context);
    });
  }

  Future<bool> confirmExit() async {
    return await showDialog(
          context: context,
          builder: (_) {
            return Dialog(
              backgroundColor: Colors.white, // BG dialog jadi putih
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// IMAGE ICON
                    Image.asset(
                      "assets/hint.png",
                      width: 178,
                      height: 115,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Apakah Anda yakin ingin Keluar?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Ini akan secara otomatis menghapus semua progres pelaporan yang Anda buat!!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff991B1B),
                            ),
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: const Text(
                              "Keluar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff2E7D32),
                            ),
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text(
                              "Batal",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: confirmExit,

      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              final exit = await confirmExit();

              if (exit) {
                Navigator.pop(context);
              }
            },
          ),
          title: const Text("Pelaporan Volunteer"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// EVENT CARD
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/event1.png",
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Penanaman 100 Pohon Mangrove",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "Dinas Lingkungan Hidup Jakarta",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// KATEGORI
              const Text(
                "Kategori",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 10),

              Column(
                children: categories.map((cat) {
                  return RadioListTile(
                    value: cat,
                    groupValue: selectedCategory,
                    activeColor: const Color(0xff2E7D32),
                    title: Text(cat),
                    onChanged: (val) {
                      setState(() {
                        selectedCategory = val;
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 16),

              /// ALASAN
              const Text(
                "Alasan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: reasonController,
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (_) {
                  setState(() {});
                },
              ),

              const SizedBox(height: 20),

              /// BUKTI
              const Text(
                "Bukti",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              GestureDetector(
                onTap: pickImage,

                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),

                  child: imageFile == null
                      ? const Center(
                          child: Text(
                            "Upload Bukti\n(JPG / PNG maks 5MB)",
                            textAlign: TextAlign.center,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(imageFile!, fit: BoxFit.cover),
                        ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isValid ? const Color(0xff2E7D32) : Colors.grey,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),

            onPressed: isValid ? submitReport : null,

            child: const Text(
              'Ajukan Laporan',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
