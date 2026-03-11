import 'package:flutter/material.dart';

class TinjauArtikelPage extends StatelessWidget {
  const TinjauArtikelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tinjau Artikel User"),
      ),
      body: const Center(
        child: Text("Halaman Tinjau Artikel"),
      ),
    );
  }
}