import 'package:flutter/material.dart'; // Importa el framework de Flutter
import 'package:app_tareas/splash_screen.dart'; // Importa la pantalla splash inicial

void main() {
  runApp(const MainApp()); // Punto de entrada: ejecuta la app principal
}

class MainApp extends StatelessWidget {
  // Widget principal de la aplicación
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login y tarea", // Título de la app
      home: const SplashScreen(), // Pantalla inicial: splash animado
      theme: ThemeData(
        primarySwatch: Colors.red, // Color principal de la app
        scaffoldBackgroundColor: Colors.white, // Fondo blanco para pantallas
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red, // Color de fondo de la AppBar
          foregroundColor: Colors.white, // Color de texto/iconos en la AppBar
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Color de fondo de los botones
            foregroundColor:
                Colors.white, // Color de texto/iconos en los botones
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12,
              ), // Bordes redondeados en botones
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 32,
            ), // Espaciado interno de los botones
            textStyle: const TextStyle(
              fontSize: 18, // Tamaño de fuente en los botones
              fontWeight: FontWeight.bold, // Negrita en los botones
            ),
          ),
        ),
      ),
    );
  }
}
