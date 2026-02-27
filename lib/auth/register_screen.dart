import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.abc_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: Center(
        child: Text(
          'Halaman Register',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
