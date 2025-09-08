import 'package:flutter/material.dart'; // Herramientas visuales de Flutter
import 'package:app_tareas/welcome_splash.dart'; // Pantalla de bienvenida animada

class LoginFields extends StatefulWidget {
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  final _formKey = GlobalKey<FormState>(); // Llave para validar el formulario
  final _emailCtrl = TextEditingController(); // Controlador del campo email
  final _passCtrl = TextEditingController(); // Controlador del campo contraseña

  bool _obscure = true; // Oculta o muestra la contraseña
  bool _loading = false; // Indica si está cargando
  String? _error; // Mensaje de error global

  @override
  void dispose() {
    _emailCtrl.dispose(); // Libera recursos del email
    _passCtrl.dispose(); // Libera recursos de la contraseña
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus(); // Oculta el teclado
    final ok = _formKey.currentState?.validate() ?? false; // Valida los campos
    if (!ok) return; // Si no es válido, no continúa

    setState(() {
      _loading = true; // Activa modo cargando
      _error = null; // Limpia errores previos
    });

    try {
      await Future.delayed(
        const Duration(milliseconds: 2000),
      ); // Simula espera de red

      if (!mounted) return; // Evita usar context si el widget se removió
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => WelcomeSplash(
            email: _emailCtrl.text,
          ), // Navega a bienvenida animada
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(
        () => _error = 'Credenciales inválidas o error de red',
      ); // Muestra error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No pudimos iniciar sesión'),
        ), // Feedback visual
      );
    } finally {
      if (mounted) setState(() => _loading = false); // Desactiva modo cargando
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      // Agrupa campos para autocompletar
      child: Form(
        key: _formKey, // Asocia la llave de validación
        autovalidateMode: AutovalidateMode
            .onUserInteraction, // Valida mientras el usuario escribe
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Estira horizontalmente
          mainAxisSize: MainAxisSize.min, // Solo ocupa el espacio necesario
          children: [
            Center(
              child: Image.network(
                "https://portales.inacap.cl/Assets/imagenes/Comunicaciones/2019/mayo/Acreditacion-u/Acreditacion-Universidad-principal.jpg", // Logo institucional
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16), // Espacio vertical

            const Text(
              "Bienvenido a INACAP TAREAS", // Título de bienvenida
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),

            TextFormField(
              enabled: !_loading, // Deshabilita si está cargando
              controller: _emailCtrl, // Controlador email
              keyboardType: TextInputType.emailAddress, // Teclado de email
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              enableSuggestions: true,
              autofillHints: const [AutofillHints.email],
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "ejemplo@ejemplo.com",
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                final value = v?.trim() ?? '';
                if (value.isEmpty) return "Ingresa tu email";
                final emailOk = RegExp(r'^\S+@\S+\.\S+$').hasMatch(value);
                return emailOk ? null : "Email inválido";
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            ),
            const SizedBox(height: 12),

            TextFormField(
              enabled: !_loading, // Deshabilita si está cargando
              controller: _passCtrl, // Controlador contraseña
              obscureText: _obscure, // Oculta texto
              enableSuggestions: false,
              autocorrect: false,
              autofillHints: const [AutofillHints.password],
              decoration: InputDecoration(
                labelText: "Contraseña",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () => setState(
                    () => _obscure = !_obscure,
                  ), // Alterna visibilidad
                  icon: Icon(
                    _obscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  tooltip: _obscure ? "Mostrar" : "Ocultar",
                ),
              ),
              validator: (v) {
                if (v == null || v.isEmpty) return "Ingrese la contraseña";
                if (v.length < 6) return "Mínimo 6 caracteres";
                return null;
              },
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 8),

            if (_error != null)
              Text(
                _error!, // Muestra error si existe
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 16),

            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: _loading
                    ? null
                    : _submit, // Deshabilita si está cargando
                child: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Text("Ingresar"), // Texto del botón
              ),
            ),
            const SizedBox(height: 8),

            TextButton(
              onPressed: _loading
                  ? null
                  : () {}, // Botón para recuperar contraseña
              child: const Text("¿Olvidaste tu contraseña?"),
            ),
          ],
        ),
      ),
    );
  }
}
