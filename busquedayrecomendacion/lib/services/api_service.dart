import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000';
  //static const String baseUrl = 'http://192.168.1.100:8000';
  // Reemplaza 192.168.1.100 por la IP real de tu PC

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

  // Buscar libros
  static Future<List<dynamic>?> buscarLibros(String query, String token) async {
    final url = Uri.parse('$baseUrl/api/buscar-libros/?q=$query');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  // Buscar series
  static Future<List<dynamic>?> buscarSeries(String query, String token) async {
    final url = Uri.parse('$baseUrl/api/buscar-series/?q=$query');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  // Agregar libro a favoritos
  static Future<bool> agregarLibroFavorito(String libroId, String token) async {
    final url = Uri.parse('$baseUrl/api/agregar-favorito-libro/$libroId/');
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    return response.statusCode == 201 || response.statusCode == 200;
  }

  // Agregar serie a favoritos
  static Future<bool> agregarSerieFavorita(String serieId, String token) async {
    final url = Uri.parse('$baseUrl/api/agregar-favorito-pelicula/$serieId/');
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    return response.statusCode == 201 || response.statusCode == 200;
  }
}
