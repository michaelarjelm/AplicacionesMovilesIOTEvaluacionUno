// login_screen.dart
import 'package:flutter/material.dart';
import 'login_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AquaIoT',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(0, 2),
                blurRadius: 3,
                color: Color.fromRGBO(234, 231, 231, 1),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 234, 229, 229),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo con imagen
          Image.network(
            'https://i.ibb.co/SXYhZyM0/Aurora-Borealis.jpg',
            fit: BoxFit.cover,
          ),
          // Overlay gradiente oscuro para mejorar contraste
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(
                    255,
                    217,
                    211,
                    211,
                  ).withOpacity(0.55), // Más oscuro para mejor legibilidad
                  const Color.fromARGB(225, 240, 239, 239).withOpacity(0.35),
                ],
              ),
            ),
          ),
          // Contenido
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: SafeArea(
              child: Column(
                children: [
                  // Encabezado con logo y título
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(
                            255,
                            241,
                            238,
                            238,
                          ).withOpacity(0.2),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.water_drop,
                            size: 72,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Bienvenido a AquaIoT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 1,
                            height: 1.2,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 1),
                                blurRadius: 2,
                                color: Color.fromRGBO(231, 224, 224, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Ingresa tu correo y contraseña para acceder a la app.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 1.5,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Formulario de login
                  LoginFields(
                    onLogin: (email) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WelcomeScreen(email: email),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final String email;

  const WelcomeScreen({super.key, required this.email});

  String _extractNameFromEmail() {
    final parts = email.split('@');
    if (parts.isEmpty) return '';
    final raw = parts[0].trim();
    if (raw.isEmpty) return '';
    return raw[0].toUpperCase() + (raw.length > 1 ? raw.substring(1) : '');
  }

  @override
  Widget build(BuildContext context) {
    final displayName = _extractNameFromEmail();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bienvenido',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(0, 2),
                blurRadius: 3,
                color: Color.fromRGBO(227, 223, 223, 1),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(224, 250, 246, 246),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://i.ibb.co/SXYhZyM0/Aurora-Borealis.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(255, 225, 221, 221).withOpacity(0.55),
                  const Color.fromARGB(255, 218, 211, 211).withOpacity(0.35),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      255,
                      225,
                      220,
                      220,
                    ).withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Bienvenido $email',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.5,
                      height: 1.2,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          color: Color.fromRGBO(234, 229, 229, 0.895),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  if (displayName.isNotEmpty)
                    Text(
                      '¡Hola, $displayName! Esto es para ti.',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.4,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Cerrar sesión',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
