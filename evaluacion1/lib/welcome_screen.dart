import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String userEmail =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenida"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          "Bienvenido $userEmail", // Muestra el correo del usuario obtenido de los argumentos
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ), // Estilo del texto
        ),
      ),
    );
  }
}
