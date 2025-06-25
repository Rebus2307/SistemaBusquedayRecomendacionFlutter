import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    final bool esAdmin = args?['esAdmin'] ?? false;
    final String token = args?['token'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Buscar Libros'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/buscar_libros',
                arguments: {'token': token},
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('Buscar Series'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/buscar_series',
                arguments: {'token': token},
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favoritos y Recomendaciones'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/favoritos',
                arguments: {'token': token},
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Editar Perfil'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/perfil',
                arguments: {'token': token},
              );
            },
          ),
          if (esAdmin)
            ListTile(
              leading: const Icon(Icons.admin_panel_settings),
              title: const Text('Lista de Usuarios (Admin)'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/admin_usuarios',
                  arguments: {'token': token},
                );
              },
            ),
        ],
      ),
    );
  }
}
