import 'package:flutter/material.dart';

import 'widgets/volunteer/volunteer_thumbnail_section.dart';
import 'widgets/volunteer/volunteer_informasi_awal_section.dart';
import 'widgets/volunteer/volunteer_keterangan_section.dart';
import 'widgets/exit_popup.dart';
import 'widgets/volunteer/volunteer_success_popup.dart';

class UnggahVolunteerPage extends StatefulWidget {
  final String adminName;

  const UnggahVolunteerPage({super.key, required this.adminName});

  @override
  State<UnggahVolunteerPage> createState() => _UnggahVolunteerPageState();
}

class _UnggahVolunteerPageState extends State<UnggahVolunteerPage> {
  final judulController = TextEditingController();
  final lokasiController = TextEditingController();
  final pesertaController = TextEditingController();
  final penyelenggaraController = TextEditingController();
  final deskripsiController = TextEditingController();
  final kriteriaController = TextEditingController();

  String? thumbnailName;

  bool get isValid =>
      thumbnailName != null &&
      judulController.text.isNotEmpty &&
      lokasiController.text.isNotEmpty &&
      pesertaController.text.isNotEmpty &&
      deskripsiController.text.isNotEmpty &&
      kriteriaController.text.isNotEmpty;

  Future<void> submitVolunteer() async {
    await showDialog(
      context: context,
      builder: (_) => VolunteerSuccessPopup(
        onContinue: () {
          Navigator.pop(context);
          Navigator.pop(context, true);
        },
      ),
    );
  }

  Future<bool> handleExit() async {
    return await confirmExit(context);
  }

  @override
  void initState() {
    super.initState();

    judulController.addListener(() => setState(() {}));
    lokasiController.addListener(() => setState(() {}));
    pesertaController.addListener(() => setState(() {}));
    deskripsiController.addListener(() => setState(() {}));
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
              if (await handleExit()) Navigator.pop(context);
            },
          ),
          title: const Text(
            "Tambah Volunteer",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              VolunteerThumbnailSection(
                fileName: thumbnailName,
                onUpload: (name) {
                  setState(() {
                    thumbnailName = name;
                  });
                },
                onDelete: () {
                  setState(() {
                    thumbnailName = null;
                  });
                },
              ),

              const SizedBox(height: 18),

              VolunteerInformasiAwalSection(
                judulController: judulController,
                lokasiController: lokasiController,
                pesertaController: pesertaController,
                penyelenggaraController: penyelenggaraController,
              ),

              const SizedBox(height: 18),

              VolunteerKeteranganSection(
                deskripsiController: deskripsiController,
                kriteriaController: kriteriaController,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18),
          child: ElevatedButton(
            onPressed: isValid ? submitVolunteer : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isValid ? const Color(0xff2E7D32) : Colors.grey,
              minimumSize: const Size(double.infinity, 54),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Tambah Volunteer",
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
