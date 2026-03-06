import 'package:eduvogreen/auth/auth_service.dart';
import 'package:flutter/material.dart';

class TombolMasuk extends StatelessWidget {
  const TombolMasuk({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.mounted,
  }) : _formKey = formKey, _emailController = emailController, _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(
            0xFF4FA057,
          ),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              50,
            ),
          ),
          elevation: 0,
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            try {
              await AuthService().logIn(
                email: _emailController.text
                    .trim(),
                password: _passwordController.text
                    .trim(),
              );
    
              if (!mounted) return;
              Navigator.pushReplacementNamed(
                context,
                '/home',
              );
            } catch (e) {
              if (!mounted) return;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                SnackBar(
                  content: Text(
                    'Login gagal: $e',
                  ),
                ),
              );
            }
          }
        },
        child: const Text(
          "Masuk",
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
