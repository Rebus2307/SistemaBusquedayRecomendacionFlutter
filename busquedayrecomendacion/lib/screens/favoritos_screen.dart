import 'package:flutter/material.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos y Recomendaciones')),
      body: const Center(
        child: Text('Pantalla de favoritos y recomendaciones'),
      ),
    );
  }
}
