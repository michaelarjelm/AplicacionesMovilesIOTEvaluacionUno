import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login y Tareas",
      debugShowCheckedModeBanner: false, // Oculta el banner de debug
      theme: ThemeData(primarySwatch: Colors.green),

      home: const LoginScreen(),
    );
  }
}
