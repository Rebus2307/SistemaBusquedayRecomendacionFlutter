import 'package:flutter/material.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? token;

  Future<void> login() async {
    final result = await ApiService.login(
      emailController.text,
      passwordController.text,
    );
    if (!mounted) return;
    setState(() {
      token = result;
    });
    if (token != null) {
      final userData = await ApiService.getUsuarioActual(token!);
      if (!mounted) return;
      final esAdmin =
          userData?['is_staff'] == true || userData?['is_superuser'] == true;
      Navigator.pushReplacementNamed(
        context,
        '/dashboard',
        arguments: {'token': token, 'esAdmin': esAdmin},
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login fallido')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: login,
              child: const Text('Iniciar sesión'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('¿No tienes cuenta? Regístrate aquí'),
            ),
            if (token != null) Text('Token: $token'),
          ],
        ),
      ),
    );
  }
}
