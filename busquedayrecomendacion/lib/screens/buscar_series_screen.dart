import 'package:flutter/material.dart';
import '../services/api_service.dart';

class BuscarSeriesScreen extends StatefulWidget {
  const BuscarSeriesScreen({super.key});

  @override
  State<BuscarSeriesScreen> createState() => _BuscarSeriesScreenState();
}

class _BuscarSeriesScreenState extends State<BuscarSeriesScreen> {
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

  Future<void> buscarSeries(String query) async {
    setState(() => cargando = true);
    final res = await ApiService.buscarSeries(query, token);
    if (!mounted) return;
    setState(() {
      resultados = res;
      cargando = false;
    });
  }

  Future<void> agregarAFavoritos(String serieId) async {
    final exito = await ApiService.agregarSerieFavorita(serieId, token);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          exito
              ? 'Serie agregada a favoritos'
              : 'No se pudo agregar a favoritos',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Series')),
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
                      labelText: 'Buscar serie',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => buscarSeries(_controller.text),
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
                    final serie = resultados![index];
                    return ListTile(
                      leading:
                          serie['imagen_url'] != null &&
                              serie['imagen_url'] != ''
                          ? Image.network(
                              serie['imagen_url'],
                              width: 50,
                              height: 70,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.tv),
                            )
                          : Icon(Icons.tv),
                      title: Text(serie['titulo'] ?? 'Sin título'),
                      subtitle: Text(serie['descripcion'] ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () => agregarAFavoritos(
                          serie['show_id']?.toString() ?? '',
                        ),
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
