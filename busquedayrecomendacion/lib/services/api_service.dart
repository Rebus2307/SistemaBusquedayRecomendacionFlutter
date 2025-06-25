import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000';

  static Future<String?> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/token/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['access'];
    }
    return null;
  }

  static Future<bool> register(Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/api/usuarios/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response.statusCode == 201;
  }

  static Future<Map<String, dynamic>?> getUsuarioActual(String token) async {
    final url = Uri.parse('$baseUrl/api/usuarios/me/');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  // Agrega aquí métodos para buscar series, favoritos, editar perfil, etc.
}
