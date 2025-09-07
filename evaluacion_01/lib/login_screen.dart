import 'package:evaluacion_01/login_fields.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.red, // color corporativo en AppBar
        foregroundColor: Colors.white, // texto en blanco
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: const LoginFields(), // Ojo: lo hacemos const si no recibe params
            ),
          ),
        ),
      ),
    );
  }
}
