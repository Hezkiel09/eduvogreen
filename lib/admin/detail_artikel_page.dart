import 'package:flutter/material.dart';
import 'revisi_artikel_page.dart';
import 'package:eduvogreen/admin/widgets/tinjau_artikel/artikel_action_button.dart';
import 'package:eduvogreen/admin/models/asrtikel_model.dart';

class DetailArtikelPage extends StatelessWidget {
  final ArtikelModel artikel;
  final VoidCallback refresh;

  const DetailArtikelPage({
    super.key,
    required this.artikel,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    final revisi = artikel.status == ArtikelStatus.revisiUser;

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Image.asset(artikel.image),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              children: [
                ArtikelActionButton(
                  text: 'Revisi',
                  enabled: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RevisiArtikelPage(
                          artikel: artikel,
                          onSubmit: refresh,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                ArtikelActionButton(
                  text: 'Publikasikan',
                  enabled: !revisi,
                  onTap: () {
                    artikel.status = ArtikelStatus.disetujui;
                    refresh();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}