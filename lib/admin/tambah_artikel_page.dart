import 'package:flutter/material.dart';

import 'widgets/artikel_header_section.dart';
import 'widgets/artikel_identitas_section.dart';
import 'widgets/artikel_isi_section.dart';
import 'widgets/artikel_referensi_section.dart';
import 'widgets/exit_popup.dart';
import 'widgets/success_popup.dart';

class TambahArtikelPage extends StatefulWidget {
  final String adminName;

  const TambahArtikelPage({super.key, required this.adminName});

  @override
  State<TambahArtikelPage> createState() => _TambahArtikelPageState();
}

class _TambahArtikelPageState extends State<TambahArtikelPage> {
  final judulController = TextEditingController();
  final isiController = TextEditingController();
  final youtubeController = TextEditingController();

  List<TextEditingController> referensiControllers = [TextEditingController()];

  String? kategori;
  String? fileName;

  bool get isValid {
    return fileName != null &&
        judulController.text.trim().isNotEmpty &&
        kategori != null &&
        isiController.text.trim().isNotEmpty &&
        referensiControllers.isNotEmpty &&
        referensiControllers.first.text.trim().isNotEmpty;
  }

  Future<bool> handleExit() async {
    return await confirmExit(context);
  }

  Future<void> submitArtikel() async {
    await showDialog(
      context: context,
      builder: (_) => SuccessPopup(
        adminName: widget.adminName,
        onContinue: () {
          Navigator.pop(context);
          Navigator.pop(context, true);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    judulController.addListener(_refreshForm);
    isiController.addListener(_refreshForm);
    youtubeController.addListener(_refreshForm);

    for (var controller in referensiControllers) {
      controller.addListener(_refreshForm);
    }
  }

  void _refreshForm() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: handleExit,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff2E7D32)),
            onPressed: () async {
              if (await handleExit()) {
                Navigator.pop(context);
              }
            },
          ),
          title: const Text(
            "Tambah Artikel",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              ArtikelHeaderSection(
                fileName: fileName,
                onUpload: (name) {
                  setState(() {
                    fileName = name;
                  });
                },
                onDelete: () {
                  setState(() {
                    fileName = null;
                  });
                },
              ),

              const SizedBox(height: 18),

              ArtikelIdentitasSection(
                judulController: judulController,
                kategori: kategori,
                onKategoriChanged: (value) {
                  setState(() {
                    kategori = value;
                  });
                },
              ),

              const SizedBox(height: 18),

              ArtikelIsiSection(controller: isiController),

              const SizedBox(height: 18),

              ArtikelReferensiSection(
                referensiControllers: referensiControllers,
                youtubeController: youtubeController,
              ),
            ],
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18),
          child: ElevatedButton(
            onPressed: isValid ? submitArtikel : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isValid ? const Color(0xff2E7D32) : Colors.grey,
              minimumSize: const Size(double.infinity, 54),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Tambah Artikel",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
