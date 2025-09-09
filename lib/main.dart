import 'package:flutter/material.dart';
import 'screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

//Widget raíz de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      const Color inacapRed = Color(0xFFE30513);

    return MaterialApp(
            title: 'Evaluación Sumativa 1',
       debugShowCheckedModeBanner: false,

      //theme define el diseño visual y los colores de la aplicación.
      theme: ThemeData(        
        primaryColor: inacapRed,
        appBarTheme: const AppBarTheme(
          backgroundColor: inacapRed,
          foregroundColor: Colors.white,
        ),
        //estilo global de los botones elevados.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: inacapRed, 
            foregroundColor: Colors.white, 
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}