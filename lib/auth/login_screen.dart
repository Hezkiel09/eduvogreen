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

  bool rememberMe = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan kata sandi wajib diisi')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      await authService.logIn(email: email, password: password);

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login gagal: $e')));
    } finally {
      if (mounted) setState(() => isLoading = false);
    }

    // hint text di box bar
    // InputDecoration unputStyle(String hint, IconData icon) {
    //   return InputDecoration(
    //     hintText: hint,
    //     prefixIcon: Icon(icon),
    //     filled: true,
    //     fillColor: Colors.grey.shade200,
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(16),
    //       borderSide: BorderSide.none,
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/karakter-manusia.png', height: 200),
              ),

              const SizedBox(height: 24),

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
