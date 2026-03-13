class UserModel {
  final String id;
  final String? namaPanjang;
  final String username;
  final String email;
  final String? fotoProfil;
  final String? tanggalLahir;

  UserModel({
    required this.id,
    required this.namaPanjang,
    required this.email,
    required this.username,
    required this.fotoProfil,
    required this.tanggalLahir,
  });

  factory UserModel.fromSupabase(Map<String, dynamic> json, String email) {
    return UserModel(
      id: json['id'] as String,
      namaPanjang: json['full_name'] as String?,
      username: json['username'] as String? ?? '',
      email: email,
      fotoProfil: json['avatar_url'] as String?,
      tanggalLahir: json['birth_date'] as String?,
    );
  }

  Map<String, dynamic> toSupabase() {
    return {
      'id': id,
      'full_name': namaPanjang,
      'username': username,
      'avatar_url': fotoProfil,
      'birth_date': tanggalLahir,
    };
  }

  @override
  String toString() {
    return 'UserModel(id: $id, nama: $namaPanjang, email: $email, username: $username, fotoProfil: $fotoProfil)';
  }
}
