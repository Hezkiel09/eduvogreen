class UserModel {
  final String? namaPanjang;
  final String username;
  final String email;
  final String? fotoProfil;
  final String? tanggalLahir;

  UserModel({
    required this.namaPanjang,
    required this.email,
    required this.username,
    required this.fotoProfil,
    required this.tanggalLahir,
  });

  @override
  String toString() {
    return 'UserModel(nama: $namaPanjang, email: $email, fotoProfil: $fotoProfil, username: $username, fotoProfil: $fotoProfil, tanggalLagir: $tanggalLahir)';
  }
}
