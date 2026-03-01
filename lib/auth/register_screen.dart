import 'package:eduvogreen/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  bool _obscurePassword = true;

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd MMMM yyyy').format(pickedDate);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _handleRegister(BuildContext context) {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Semua kolom wajib diisi')));
      return;
    }

    if (!email.contains('@')) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Format email tidak valid')));
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password minimal 6 karakter')),
      );
      return;
    }

    context.read<AuthCubit>().register(name, email, password);
  }

  // TEXT FIELD dengan controller
  Widget _buildTextField(
    String hint,
    IconData icon,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black, fontSize: 13),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: 18, color: Colors.grey),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // PASSWORD FIELD
  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      style: const TextStyle(color: Colors.black, fontSize: 13),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, size: 18, color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            size: 18,
            color: Colors.grey,
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
        hintText: 'Password',
        hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // DATE FIELD
  Widget _buildDateField() {
    return TextField(
      controller: _dateController,
      readOnly: true,
      onTap: _selectDate,
      style: const TextStyle(color: Colors.black, fontSize: 13),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.calendar_today,
          size: 18,
          color: Colors.grey,
        ),
        hintText: "Tanggal Lahir",
        hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registrasi berhasil! Silakan masuk.'),
            ),
          );
          Navigator.pushReplacementNamed(context, '/login');
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registrasi gagal: ${state.errorMessage}')),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is Loading;

        return Scaffold(
          body: Stack(
            children: [
              // BACKGROUND
              SizedBox.expand(
                child: Image.asset(
                  'assets/diatas-hijau.png',
                  fit: BoxFit.cover,
                ),
              ),

              // OVERLAY
              Container(color: const Color(0xFF4FA057).withValues(alpha: 0.9)),

              SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    Expanded(
                      child: Stack(
                        children: [
                          // WHITE CARD
                          Positioned(
                            top: 155,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: SingleChildScrollView(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                  40,
                                  70,
                                  40,
                                  40,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Buat Akun EduvoGreen",
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    const Text(
                                      "Mulai dari tahu, lanjutkan dengan aksi",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ),

                                    const SizedBox(height: 30),

                                    _buildTextField(
                                      "Nama Lengkap",
                                      Icons.person,
                                      _nameController,
                                    ),
                                    const SizedBox(height: 15),

                                    _buildTextField(
                                      "Email",
                                      Icons.email,
                                      _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    const SizedBox(height: 15),

                                    _buildPasswordField(),
                                    const SizedBox(height: 15),

                                    _buildDateField(),
                                    const SizedBox(height: 30),

                                    // BUTTON
                                    SizedBox(
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
                                        onPressed: isLoading
                                            ? null
                                            : () => _handleRegister(context),
                                        child: isLoading
                                            ? const CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : const Text(
                                                "Daftar",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                      ),
                                    ),

                                    const SizedBox(height: 20),

                                    Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            "atau",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 20),

                                    // GOOGLE BUTTON
                                    SizedBox(
                                      width: double.infinity,
                                      height: 45,
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          side: BorderSide(
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icon-gg.png',
                                              height: 18,
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "Daftar dengan akun Google",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20),

                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Sudah punya akun? ",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                '/login',
                                              );
                                            },
                                            child: const Text(
                                              "Masuk Sekarang",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF5B6CF6),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // IMAGE
                          Positioned(
                            top: 10,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Image.asset(
                                'assets/karakter-manusia.png',
                                height: 200,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
