class Serie {
  final int id;
  final String titulo;
  final String descripcion;

  Serie({required this.id, required this.titulo, required this.descripcion});

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      id: json['id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
    );
  }
}
