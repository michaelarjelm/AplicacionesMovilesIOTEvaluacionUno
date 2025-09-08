import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();   // <- clave del formulario
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingrese correo electrónico';
    }
    if (!value.contains('@')) {
      return 'El correo debe contener "@"';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  void _submit() {
    // 🔹 aquí ocurre la magia: validar antes de navegar
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen(email: email)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,    // <- asociamos la clave aquí
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: _validateEmail,   // <- valida el correo
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: _obscure,
                validator: _validatePassword,  // <- valida la contraseña
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,    // <- llama a validar y navegar
                child: Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
