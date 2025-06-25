class Usuario {
  final int id;
  final String email;
  final String nombre;
  final String apellidos;
  final String? fotoPerfil;

  Usuario({
    required this.id,
    required this.email,
    required this.nombre,
    required this.apellidos,
    this.fotoPerfil,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      email: json['email'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      fotoPerfil: json['foto_perfil'],
    );
  }
}
