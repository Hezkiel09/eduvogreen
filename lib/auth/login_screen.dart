import 'package:eduvogreen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selamat Datang Kembali',
                style: TextStyle(fontSize: 32),
              ),

              const SizedBox(height: 8),

              const Text(
                'Masuk untuk mulai aksi lingkunganmu',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 24),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email dan kata sandi wajib diisi'),
                      ),
                    );
                    return;
                  }

                  try {
                    await authService.logIn(email: email, password: password);

                    if (!mounted) return;

                    Navigator.pushReplacementNamed(context, '/home');
                  } catch (e) {
                    if (!mounted) return;

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Login gagal: $e')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DAA51),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Masuk'),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
                child: const Text('Belum punya akun? Daftar Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
