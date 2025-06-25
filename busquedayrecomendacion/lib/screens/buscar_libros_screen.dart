import 'package:flutter/material.dart';
import '../services/api_service.dart';

class BuscarLibrosScreen extends StatefulWidget {
  const BuscarLibrosScreen({super.key});

  @override
  State<BuscarLibrosScreen> createState() => _BuscarLibrosScreenState();
}

class _BuscarLibrosScreenState extends State<BuscarLibrosScreen> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic>? resultados;
  bool cargando = false;
  late String token;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    token = args?['token'] ?? '';
  }

  Future<void> buscarLibros(String query) async {
    setState(() => cargando = true);
    final res = await ApiService.buscarLibros(query, token);
    if (!mounted) return;
    setState(() {
      resultados = res;
      cargando = false;
    });
  }

  Future<void> agregarAFavoritos(String libroId) async {
    final exito = await ApiService.agregarLibroFavorito(libroId, token);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          exito
              ? 'Libro agregado a favoritos'
              : 'No se pudo agregar a favoritos',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Libros')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Buscar libro',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => buscarLibros(_controller.text),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (cargando) const CircularProgressIndicator(),
            if (resultados != null && resultados!.isEmpty)
              const Text('No se encontraron resultados'),
            if (resultados != null && resultados!.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: resultados!.length,
                  itemBuilder: (context, index) {
                    final libro = resultados![index];
                    return ListTile(
                      leading:
                          libro['portada_url'] != null &&
                              libro['portada_url'] != ''
                          ? Image.network(
                              libro['portada_url'],
                              width: 50,
                              height: 70,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.book),
                            )
                          : Icon(Icons.book),
                      title: Text(libro['titulo'] ?? 'Sin título'),
                      subtitle: Text(libro['autor'] ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () =>
                            agregarAFavoritos(libro['isbn']?.toString() ?? ''),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
