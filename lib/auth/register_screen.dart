import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'register_password_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _dateController = TextEditingController();

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
    _dateController.dispose();
    super.dispose();
  }

  // TEXT FIELD
  Widget _buildTextField(String hint, IconData icon) {
    return TextField(
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
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND
          SizedBox.expand(
            child: Image.asset('assets/diatas-hijau.png', fit: BoxFit.cover),
          ),

          // OVERLAY
          Container(color: const Color(0xFF4FA057).withOpacity(0.9)),

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
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(40, 70, 40, 40),
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

                              _buildTextField("Nama Lengkap", Icons.person),
                              const SizedBox(height: 15),

                              _buildTextField("Email", Icons.email),
                              const SizedBox(height: 15),

                              _buildDateField(),
                              const SizedBox(height: 30),

                              // BUTTON
                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4FA057),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const RegisterPasswordScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Berikutnya",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(color: Colors.grey[300]),
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
                                    child: Divider(color: Colors.grey[300]),
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
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    side: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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

                              const Center(
                                child: Text.rich(
                                  TextSpan(
                                    text: "Sudah punya akun? ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Masuk Sekarang",
                                        style: TextStyle(
                                          color: Color(0xFF5B6CF6),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
  }
}

class Dot extends StatefulWidget {
  final int delay;
  const Dot({this.delay = 0});

  @override
  State<Dot> createState() => _DotState();
}

class _DotState extends State<Dot> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      controller.repeat(reverse: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0, controller.value * -8),
          child: child,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        width: 6,
        height: 6,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
