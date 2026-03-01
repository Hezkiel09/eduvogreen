class Validators {
  static String? required(String? value, String field) {
    if (value == null || value.isEmpty) {
      return "$field wajib diisi";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Email wajib diisi";
    }
    if (!value.contains("@")) {
      return "Format email tidak valid";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Kata sandi wajib diisi";
    }
    if (value.length < 6) {
      return "Minimal 6 karakter";
    }
    return null;
  }
}