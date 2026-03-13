import 'package:flutter/material.dart';

class LaporanMasalahPage extends StatelessWidget {
  const LaporanMasalahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Masalah"),
      ),
      body: const Center(
        child: Text("Halaman Laporan Masalah"),
      ),
    );
  }
}