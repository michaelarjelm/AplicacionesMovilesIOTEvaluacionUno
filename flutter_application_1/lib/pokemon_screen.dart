import 'package:flutter/material.dart';

class CartasPokemonScreen extends StatefulWidget {
  // Pantalla principal de cartas Pokémon
  const CartasPokemonScreen({super.key}); // constructor

  @override
  State<CartasPokemonScreen> createState() => _CartasPokemonScreenState(); // crear estado
}

class _CartasPokemonScreenState extends State<CartasPokemonScreen> {
  // estado de la pantalla
  final _busquedaCtrl =
      TextEditingController(); // controlador del campo de búsqueda
  String _filtro = 'todas'; // 'todas' | 'mis' | 'faltantes'

  @override
  void dispose() {
    // limpiar recursos
    _busquedaCtrl.dispose(); // liberar el controlador
    super.dispose();
  }

  void _noDisponible() {
    // función para mostrar que la función no está disponible
    ScaffoldMessenger.of(context).showSnackBar(
      // mostrar snackbar
      const SnackBar(content: Text('Función disponible próximamente 🙂')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // construir la interfaz de usuario
    return Scaffold(
      appBar: AppBar(
        // barra de navegación superior
        title: const Text('Mi colección de cartas'),
        centerTitle: true, // centrar título
        backgroundColor: Colors.amber.shade600, // color de fondo
      ),
      body: Container(
        // contenedor principal
        color: Colors.amber.shade100, // fondo amarillo pálido
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Buscador (no funcional por ahora)
                    TextField(
                      controller: _busquedaCtrl, // controlador del campo
                      decoration: const InputDecoration(
                        labelText: 'Buscar carta (ej: Pikachu, 25, 151)',
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _noDisponible(),
                    ),
                    const SizedBox(height: 12),

                    // Filtros (simulación)
                    SegmentedButton<String>(
                      // botón segmentado para filtros
                      segments: const [
                        ButtonSegment(value: 'todas', label: Text('Todas')),
                        ButtonSegment(value: 'mis', label: Text('Mis cartas')),
                        ButtonSegment(
                          value: 'faltantes',
                          label: Text('Faltantes'),
                        ),
                      ],
                      selected: <String>{_filtro},
                      onSelectionChanged: (sel) {
                        setState(() => _filtro = sel.first);
                        _noDisponible();
                      },
                    ),
                    const SizedBox(height: 16),

                    // Placeholder de “lista de cartas”
                    Card(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.collections,
                              size: 48,
                              color: Colors.black54,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tu colección aparecerá aquí',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Agrega cartas a tu colección para verlas listadas aquí.',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium, // estilo del texto
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            FilledButton.icon(
                              onPressed: _noDisponible,
                              icon: const Icon(Icons.add),
                              label: const Text('Agregar carta manualmente'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Botones secundarios (simulación)
                    Wrap(
                      // usar Wrap para ajustar botones
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: _noDisponible,
                          icon: const Icon(Icons.qr_code_scanner),
                          label: const Text('Escanear carta'),
                        ),
                        OutlinedButton.icon(
                          onPressed: _noDisponible,
                          icon: const Icon(Icons.import_export),
                          label: const Text('Importar listado'),
                        ),
                        OutlinedButton.icon(
                          onPressed: _noDisponible,
                          icon: const Icon(Icons.share),
                          label: const Text('Compartir progreso'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
