import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evaluación Flutter IoT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // tema personalizado de la aplicación
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      initialRoute: '/', // ruta inicial de la aplicación
      routes: {
        '/': (context) => const LoginScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}
