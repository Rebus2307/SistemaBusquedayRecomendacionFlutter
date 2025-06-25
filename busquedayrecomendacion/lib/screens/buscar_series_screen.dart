import 'package:flutter/material.dart';

class BuscarSeriesScreen extends StatelessWidget {
  const BuscarSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Series')),
      body: const Center(child: Text('Pantalla de búsqueda de series')),
    );
  }
}
