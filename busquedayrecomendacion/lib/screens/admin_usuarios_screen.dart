import 'package:flutter/material.dart';

class AdminUsuariosScreen extends StatelessWidget {
  const AdminUsuariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Administrar Usuarios')),
      body: const Center(child: Text('Pantalla de administración de usuarios')),
    );
  }
}
