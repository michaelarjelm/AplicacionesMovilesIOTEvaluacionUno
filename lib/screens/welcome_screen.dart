import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String email;
  const WelcomeScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bienvenido',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(email, style: TextStyle(fontSize: 20)),
              SizedBox(height: 24),
              Text(
                'Has iniciado sesión correctamente.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
