import 'package:flutter/material.dart';
import 'login.dart';

// Función principal: punto de entrada de la aplicación
void main() {
  runApp(const MyApp()); // Se ejecuta la aplicación llamando al widget raíz
}

// Widget raíz de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos un color personalizado (rojo institucional INACAP)
    const Color inacapRed = Color(0xFFE30513);

    return MaterialApp(
      title: 'Evaluación Sumativa 1',
      debugShowCheckedModeBanner: false, // Oculta la etiqueta "debug"

      // Tema global de la aplicación
      theme: ThemeData(
        primaryColor: inacapRed,
        appBarTheme: const AppBarTheme(
          backgroundColor: inacapRed,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: inacapRed,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      // Pantalla inicial
      home: const LoginScreen(),
    );
  }
}

