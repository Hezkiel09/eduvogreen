import 'package:flutter/material.dart';
import 'package:eduvogreen/admin/data/dummy_ertikel_data.dart';
import 'package:eduvogreen/admin/widgets/tinjau_artikel/artikel_tab_bar.dart';
import 'package:eduvogreen/admin/widgets/tinjau_artikel/artikel_card.dart';
import 'detail_artikel_page.dart';
import 'package:eduvogreen/admin/models/asrtikel_model.dart';

class TinjauArtikelPage extends StatefulWidget {
  const TinjauArtikelPage({super.key});

  @override
  State<TinjauArtikelPage> createState() => _TinjauArtikelPageState();
}

class _TinjauArtikelPageState extends State<TinjauArtikelPage> {
  int selected = 0;

  List<ArtikelModel> get filtered {
    return artikelNotifier.value.where((e) {
      if (selected == 0) return e.status == ArtikelStatus.belumDitinjau;
      if (selected == 1) {
        return e.status == ArtikelStatus.prosesPeninjauan ||
            e.status == ArtikelStatus.revisiUser;
      }
      return e.status == ArtikelStatus.disetujui;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tinjau Artikel'),
      ),
      body: Column(
        children: [
          ArtikelTabBar(
            selected: selected,
            onTap: (i) {
              setState(() {
                selected = i;
              });
            },
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: artikelNotifier,
              builder: (_, __, ___) {
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (_, i) {
                    final artikel = filtered[i];

                    return ArtikelCard(
                      artikel: artikel,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailArtikelPage(
                              artikel: artikel,
                              refresh: () {
                                artikelNotifier.notifyListeners();
                                setState(() {
                                  selected = 1;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}