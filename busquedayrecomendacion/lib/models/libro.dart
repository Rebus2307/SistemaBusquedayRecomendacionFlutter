class Libro {
  final int id;
  final String titulo;
  final String autor;

  Libro({required this.id, required this.titulo, required this.autor});

  factory Libro.fromJson(Map<String, dynamic> json) {
    return Libro(id: json['id'], titulo: json['titulo'], autor: json['autor']);
  }
}
