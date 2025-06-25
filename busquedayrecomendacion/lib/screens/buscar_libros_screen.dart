import 'package:flutter/material.dart';

class BuscarLibrosScreen extends StatelessWidget {
  const BuscarLibrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Libros')),
      body: const Center(child: Text('Pantalla de búsqueda de libros')),
    );
  }
}
