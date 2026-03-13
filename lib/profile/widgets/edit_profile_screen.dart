import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth_cubit.dart';
import '../cubit/profile_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with current data
    final authState = context.read<AuthCubit>().state;
    if (authState is Success) {
      _nameController.text = authState.user.namaPanjang ?? '';
      _usernameController.text = authState.user.username;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;

    context.read<ProfileCubit>().updateProfile(
          name: _nameController.text.trim(),
          username: _usernameController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: const Color(0xFF148A43),
            ),
          );
          Navigator.pop(context); // Go back to profile screen
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is ProfileLoading;
        
        return Scaffold(
          backgroundColor: const Color(0xFFF9F9F9),
          appBar: AppBar(
            title: const Text(
              'Edit Profil',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black87),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Avatar Section
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 54,
                            backgroundImage: AssetImage('assets/profile_default.jpg'),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF148A43),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 40),

                    // Name Field
                    _buildTextField(
                      label: 'Nama Lengkap',
                      controller: _nameController,
                      icon: Icons.person_outline,
                      hint: 'Masukkan nama lengkap',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Nama lengkap tidak boleh kosong';
                        }
                        if (value.trim().length < 3) {
                          return 'Nama minimal 3 karakter';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Username Field
                    _buildTextField(
                      label: 'Username',
                      controller: _usernameController,
                      icon: Icons.alternate_email,
                      hint: 'Contoh: johndoe',
                      prefixText: '@',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Username tidak boleh kosong';
                        }
                        if (value.trim().contains(' ')) {
                          return 'Username tidak boleh memakai spasi';
                        }
                        if (value.trim().length < 4) {
                          return 'Username minimal 4 karakter';
                        }
                        // Simple regex to check alphanumeric only
                        if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value.trim())) {
                          return 'Hanya boleh huruf, angka, dan underscore (_)';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 12),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Username ini akan digunakan sebagai nama penulis di artikel yang kamu buat.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _handleSave,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF148A43),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Simpan Perubahan',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    required String? Function(String?) validator,
    String? prefixText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black38),
            prefixIcon: Icon(icon, color: Colors.black45, size: 22),
            prefixText: prefixText,
            prefixStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFF148A43), width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
