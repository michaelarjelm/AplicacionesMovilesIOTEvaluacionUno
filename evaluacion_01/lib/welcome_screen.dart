import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String email; // recibe el correo ingresado

  const WelcomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenida"),
        backgroundColor: Colors.red, // color corporativo
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 80,
                color: Colors.red,
              ),
              const SizedBox(height: 20),
              Text(
                "Bienvenido $email 👋",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // vuelve al login
                },
                child: const Text("Cerrar sesión"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
