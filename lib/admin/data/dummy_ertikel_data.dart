import 'package:eduvogreen/admin/models/asrtikel_model.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<ArtikelModel>> artikelNotifier = ValueNotifier([
  ArtikelModel(
    id: '1',
    title: 'Mengembalikan Napas Pesisir: Peran Mangrove Menahan Abrasi',
    description:
        'Ekosistem mangrove menjadi benteng utama pertahanan daratan dari ancaman krisis iklim.',
    author: 'Antonio Ngarusolo',
    date: '3 Maret 2026',
    category: 'Reboisasi',
    image: 'assets/images/mangrove.png',
    status: ArtikelStatus.belumDitinjau,
  ),
  ArtikelModel(
    id: '2',
    title: 'Memulai Gaya Hidup Zero Waste dengan Prinsip 3R di Rumah',
    description:
        'Kurangi jejak karbon dengan mulai menerapkan prinsip 3R dalam rutinitas harian.',
    author: 'Admin',
    date: '3 Maret 2026',
    category: 'Pengelolaan sampah 3R',
    image: 'assets/images/zero_waste.png',
    status: ArtikelStatus.disetujui,
  ),
  ArtikelModel(
    id: '3',
    title: 'Kampanye Lingkungan Digital',
    description: 'Edukasi lingkungan melalui media digital.',
    author: 'Admin',
    date: '3 Maret 2026',
    category: 'Kampanye Lingkungan',
    image: 'assets/images/kampanye.png',
    status: ArtikelStatus.disetujui,
  ),
]);
