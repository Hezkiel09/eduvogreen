import 'package:flutter/material.dart';

class TambahArtikelPage extends StatelessWidget {
  const TambahArtikelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Artikel"),
      ),
      body: const Center(
        child: Text("Halaman Tambah Artikel"),
      ),
    );
  }
}