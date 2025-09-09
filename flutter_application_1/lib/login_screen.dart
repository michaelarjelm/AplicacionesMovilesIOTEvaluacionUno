import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_fields.dart';

class LoginScreen extends StatelessWidget {
  // pantalla de inicio de sesión
  // pantalla de inicio de sesión
  const LoginScreen({super.key}); // constructor

  @override
  Widget build(BuildContext context) {
    // construir la interfaz de usuario
    return Scaffold(
      // usar Scaffold para la estructura básica
      appBar: AppBar(
        // barra de navegación superior
        title: const Text('Entrenador · Inicio de sesión'), // título
        centerTitle: true,
        backgroundColor: Colors.amber.shade600,
      ),
      body: Container(
        color: Colors.amber.shade100, // fondo amarillo pálido
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 420),
                child: LoginFields(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
