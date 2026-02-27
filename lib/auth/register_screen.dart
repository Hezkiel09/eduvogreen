import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND IMAGE
          SizedBox.expand(
            child: Image.asset(
              'assets/images/diatas-hijau.png',
              fit: BoxFit.cover,
            ),
          ),

          // GREEN OVERLAY
          Container(
            color: const Color.fromARGB(255, 15, 178, 85).withOpacity(0.85),
          ),

          // CONTENT
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        top: 80,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(24, 80, 24, 24),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // TITLE
                              const Text(
                                "Buat Akun EduvoGreen",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4A1F63),
                                ),
                              ),

                              const SizedBox(height: 8),

                              const Text(
                                "Mulai dari tahu, lanjutkan dengan aksi",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),

                              const SizedBox(height: 24),

                              _buildTextField("Nama Lengkap", Icons.person),
                              const SizedBox(height: 15),

                              _buildTextField("Email", Icons.email),
                              const SizedBox(height: 15),

                              _buildTextField("Tanggal Lahir", Icons.calendar_today),
                              const SizedBox(height: 24),

                              // BUTTON
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4FA057),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Berikutnya",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // ATAU
                              Row(
                                children: [
                                  const Expanded(child: Divider()),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "atau",
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  ),
                                  const Expanded(child: Divider()),
                                ],
                              ),

                              const SizedBox(height: 20),

                              // GOOGLE BUTTON
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: OutlinedButton.icon(
                                  icon: Image.asset(
                                    'assets/images/icon-gg.png',
                                    height: 20,
                                  ),
                                  label: const Text(
                                    "Daftar dengan akun Google",
                                    style: TextStyle(color: Color(0xFF4A1F63)),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Colors.grey.shade300),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),

                              const SizedBox(height: 20),

                              // LOGIN TEXT
                              Center(
                                child: RichText(
                                  text: const TextSpan(
                                    text: "Sudah punya akun? ",
                                    style: TextStyle(color: Colors.grey),
                                    children: [
                                      TextSpan(
                                        text: "Masuk Sekarang",
                                        style: TextStyle(
                                          color: Color(0xFF5B6CF6),
                                          fontWeight: FontWeight.w600,
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

                      // CHARACTER IMAGE — overlap di atas card putih
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SizedBox(
                            height: 160,
                            child: Image.asset(
                              'assets/images/karakter-manusia.png',
                              fit: BoxFit.contain,
                            ),
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

Widget _buildTextField(String hint, IconData icon) {
  return TextField(
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.grey),
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF2F2F2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    ),
  );
}