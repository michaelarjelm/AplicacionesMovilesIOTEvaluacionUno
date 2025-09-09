import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart'; // Importar la pantalla de inicio de sesión

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  // Widget raíz de la aplicación
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Construir la interfaz de usuario
    return MaterialApp(
      // Usar MaterialApp para configurar la app
      title: 'Cartas Pokémon', // Título de la app
      debugShowCheckedModeBanner: false, // Ocultar banner de debug
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.amber, // base amarilla
        brightness: Brightness.light, // modo claro
        fontFamily: 'Arial',
      ),
      home: const LoginScreen(), // Pantalla de inicio de sesión
    );
  }
}
