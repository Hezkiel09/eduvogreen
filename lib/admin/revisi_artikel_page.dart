import 'package:flutter/material.dart';
import 'package:eduvogreen/admin/models/asrtikel_model.dart';

class RevisiArtikelPage extends StatefulWidget {
  final ArtikelModel artikel;
  final VoidCallback onSubmit;

  const RevisiArtikelPage({
    super.key,
    required this.artikel,
    required this.onSubmit,
  });

  @override
  State<RevisiArtikelPage> createState() => _RevisiArtikelPageState();
}

class _RevisiArtikelPageState extends State<RevisiArtikelPage> {
  final controller = TextEditingController();
  List<String> files = [];

  bool get valid => controller.text.isNotEmpty && files.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 6,
              onChanged: (_) => setState(() {}),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  files.add('Screenshot.png');
                });
              },
              child: const Text('Upload'),
            ),
            ElevatedButton(
              onPressed: valid
                  ? () {
                      widget.artikel.status = ArtikelStatus.revisiUser;
                      widget.onSubmit();
                      Navigator.pop(context);
                    }
                  : null,
              child: const Text('Ajukan Revisi Kepada User'),
            ),
          ],
        ),
      ),
    );
  }
}