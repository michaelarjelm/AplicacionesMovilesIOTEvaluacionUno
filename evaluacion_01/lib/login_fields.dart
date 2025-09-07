import 'package:evaluacion_01/welcome_screen.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  bool _obscure = true;
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      // Simulación de autenticación
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      // 👉 Navegar a WelcomeScreen con el correo
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => WelcomeScreen(email: _emailCtrl.text.trim()),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = 'Error inesperado, intente de nuevo');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No pudimos iniciar sesión')),
      );
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
            Center(
              child: Image.network(
                "https://i.ibb.co/gbM1xQbB/logo-inacap.jpg",
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Bienvenido Inacapino",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),

            // Campo email
            TextFormField(
              enabled: !_loading,
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              enableSuggestions: true,
              autofillHints: const [AutofillHints.email],
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "ejemplo@correo.com",
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                final value = v?.trim() ?? '';
                if (value.isEmpty) return "Ingresa tu email";
                return value.contains('@') ? null : "Email inválido";
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            ),
            const SizedBox(height: 12),

            // Campo contraseña
            TextFormField(
              enabled: !_loading,
              controller: _passCtrl,
              obscureText: _obscure,
              enableSuggestions: false,
              autocorrect: false,
              autofillHints: const [AutofillHints.password],
              decoration: InputDecoration(
                labelText: "Contraseña",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _obscure = !_obscure),
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
                _error!,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 16),

            // Botón ingresar
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _loading ? null : _submit,
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
                    : const Text("Ingresar"),
              ),
            ),
            const SizedBox(height: 8),

            TextButton(
              onPressed: _loading ? null : () {},
              child: const Text("¿Olvidaste tu contraseña?"),
            ),
          ],
        ),
      ),
    );
  }
}
