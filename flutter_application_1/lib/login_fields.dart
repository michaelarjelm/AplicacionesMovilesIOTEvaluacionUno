import 'package:flutter/material.dart';
import 'package:flutter_application_1/pokemon_screen.dart'; // <- nueva pantalla

class LoginFields extends StatefulWidget {
  // campos de inicio de sesión
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState(); // crear estado
}

class _LoginFieldsState extends State<LoginFields> {
  // estado de los campos
  final _formKey = GlobalKey<FormState>(); // clave del formulario
  final _emailCtrl = TextEditingController(); // controlador del campo de correo
  final _passCtrl =
      TextEditingController(); // controlador del campo de contraseña

  bool _obscure = true; // ocultar contraseña
  bool _loading = false; // indicador de carga
  String? _error; // mensaje de error

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  String? _validarCorreo(String? valor) {
    // validar correo
    final v = valor?.trim() ?? ''; // eliminar espacios
    if (v.isEmpty) return 'Ingrese un correo'; // campo vacío
    if (!v.contains('@'))
      return 'Correo inválido (debe incluir "@")'; // sin "@"
    if (!v.contains('.'))
      return 'Correo inválido (debe incluir ".")'; // sin "."
    if (v.length < 5) return 'Correo demasiado corto'; // muy corto
    return null;
  }

  String? _validarClave(String? valor) {
    // validar contraseña
    final v = valor ?? ''; // obtener valor
    if (v.isEmpty) return 'Ingrese una contraseña'; // campo vacío
    if (v.length < 6)
      return 'La contraseña debe tener al menos 6 caracteres'; // muy corta
    return null; // válido
  }

  Future<void> _submit() async {
    // enviar formulario
    FocusScope.of(context).unfocus(); // ocultar teclado
    final ok = _formKey.currentState?.validate() ?? false; // validar formulario
    if (!ok) return; // si no es válido, salir

    try {
      // simular inicio de sesión
      setState(() {
        // cambiar estado
        _loading = true;
        _error = null;
      });

      await Future.delayed(const Duration(milliseconds: 500)); // simulación

      if (!mounted) return; // si el widget no está montado, salir
      Navigator.push(
        // navegar a la pantalla de bienvenida
        context,
        MaterialPageRoute(
          builder: (_) => PantallaBienvenida(correo: _emailCtrl.text.trim()),
        ),
      );
    } catch (e) {
      setState(() => _error = 'Ocurrió un problema. Intenta nuevamente.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const _EncabezadoPokemon(),
            const SizedBox(height: 16),

            Text(
              "Colección de Cartas Pokémon",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Correo
            TextFormField(
              // campo de correo
              enabled: !_loading,
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Correo electrónico",
                hintText: "usuario@ejemplo.com",
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              validator: _validarCorreo,
            ),
            const SizedBox(height: 12),

            // Contraseña
            TextFormField(
              enabled: !_loading,
              controller: _passCtrl,
              obscureText: _obscure,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Contraseña",
                prefixIcon: const Icon(Icons.lock_outline),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  tooltip: _obscure ? 'Mostrar' : 'Ocultar',
                  icon: Icon(
                    _obscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              validator: _validarClave,
            ),
            const SizedBox(height: 16),

            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  _error!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),

            // Botón ingresar
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: _loading ? null : _submit,
                icon: _loading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.login),
                label: const Text('Ingresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Encabezado con imagen
class _EncabezadoPokemon extends StatelessWidget {
  // widget privado
  const _EncabezadoPokemon(); // constructor

  @override
  Widget build(BuildContext context) {
    // construir widget
    return Column(
      children: [
        Image.network(
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png', // imagen de Pikachu
          semanticLabel: 'Logo de Pokémon',
          height: 110,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}

// --- Pantalla de Bienvenida ---
class PantallaBienvenida extends StatelessWidget {
  // pantalla de bienvenida
  // recibe el correo del usuario
  final String correo; // correo del usuario
  const PantallaBienvenida({super.key, required this.correo}); // constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenida'),
        centerTitle: true,
        backgroundColor: Colors.amber.shade600,
      ),
      body: Container(
        color: Colors.amber.shade100,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bienvenido $correo',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartasPokemonScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.style), // ícono de cartas
                label: const Text('Ir a mi colección'), // texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
