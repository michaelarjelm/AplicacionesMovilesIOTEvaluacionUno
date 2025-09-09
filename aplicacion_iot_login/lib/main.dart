import 'package:flutter/material.dart';
import 'login_screen.dart'; // Importamos la pantalla de login

// Punto de entrada de la aplicación
void main() {
  runApp(MyApp());
}

// Configuración principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configuración básica de la app
      title: 'Aplicación IOT Login',
      debugShowCheckedModeBanner: false,
      
      // Tema de la aplicación (RF9 - Estilo corporativo en escala de grises)
      theme: ThemeData(
        // Esquema de colores en escala de grises
        primarySwatch: Colors.grey,
        primaryColor: Color.fromARGB(255, 66, 60, 60), // Gris corporativo
        
        // Configuración visual adicional
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
        // Configuración de botones elevados
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 66, 60, 60), // Gris corporativo
            foregroundColor: Colors.white,
          ),
        ),
        
        // Configuración de AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 66, 60, 60), // Gris corporativo
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
        ),
      ),
      
      // Pantalla inicial de la aplicación
      home: LoginScreen(),
    );
  }
}