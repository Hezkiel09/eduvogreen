import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            spacing: 20,
            children: [
              Text(
                'Selamat Datang Kembali',
                style: TextStyle(fontSize: 32, color: Colors.black),
              ),

              TextField(
                decoration: InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(),
                ),
              ),

              TextField(
                decoration: InputDecoration(
                  label: Text('Kata Sandi'),
                  border: OutlineInputBorder(),
                ),
              ),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DAA51),
                  foregroundColor: Colors.white,

                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text(
                  'Masuk'
                  
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
