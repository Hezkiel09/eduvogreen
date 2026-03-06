import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/gestures.dart';
import 'register_password_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  bool _isLoading = false;

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
    _dateController.dispose();

    super.dispose();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black, fontSize: 13),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hint wajib diisi";
        }
        if (hint == "Email" && !value.contains("@")) {
          return "Format email tidak valid";
        }

        return null;
      },
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

  Widget _buildDateField() {
    return TextFormField(
      controller: _dateController,
      readOnly: true,
      onTap: _selectDate,
      style: const TextStyle(color: Colors.black, fontSize: 13),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Tanggal Lahir wajib diisi";
        }
        return null;
      },
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

  // =========================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/diatas-hijau.png', fit: BoxFit.cover),
          ),
          Container(color: const Color(0xFF4FA057).withOpacity(0.9)),

          SafeArea(
            bottom: false,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 155,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(40, 70, 40, 40),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
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
                                    controller: _nameController,
                                    hint: "Nama Lengkap",
                                    icon: Icons.person,
                                  ),
                                  const SizedBox(height: 15),

                                  _buildTextField(
                                    controller: _emailController,
                                    hint: "Email",
                                    icon: Icons.email,
                                  ),
                                  const SizedBox(height: 15),

                                  _buildDateField(),
                                  const SizedBox(height: 30),

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
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  RegisterPasswordScreen(
                                                    fullName: _nameController
                                                        .text
                                                        .trim(),
                                                    email: _emailController.text
                                                        .trim(),
                                                    birthDate: _dateController
                                                        .text
                                                        .trim(),
                                                  ),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        "Berikutnya",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  Center(
                                    child: Text.rich(
                                      TextSpan(
                                        text: "Sudah punya akun? ",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Masuk Sekarang",
                                            style: const TextStyle(
                                              color: Color(0xFF5B6CF6),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  '/login',
                                                );
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

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
  }
}
