import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  final String nama;
  final String email;

  const PasswordScreen({
    super.key,
    required this.nama,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Password")),
      body: Center(
        child: Text("Nama: $nama\nEmail: $email"),
      ),
    );
  }
}