import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/buscar_libros_screen.dart';
import 'screens/buscar_series_screen.dart';
import 'screens/favoritos_screen.dart';
import 'screens/perfil_screen.dart';
import 'screens/admin_usuarios_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busqueda y Recomendacion',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/buscar_libros': (context) => const BuscarLibrosScreen(),
        '/buscar_series': (context) => const BuscarSeriesScreen(),
        '/favoritos': (context) => const FavoritosScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/admin_usuarios': (context) => const AdminUsuariosScreen(),
      },
    );
  }
}
