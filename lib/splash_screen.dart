import 'package:flutter/material.dart'; // Importa el framework de Flutter
import 'package:app_tareas/login_screen.dart'; // Importa la pantalla de login

class SplashScreen extends StatefulWidget {
  // Widget splash animado
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Permite animaciones
  late AnimationController _controller; // Controlador de animación
  late Animation<double> _animation; // Animación de opacidad

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duración de la animación
      vsync: this, // Sincroniza con el ciclo de vida del widget
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ); // Animación suave

    _controller.forward(); // Inicia la animación

    Future.delayed(const Duration(seconds: 3), () {
      // Espera 3 segundos
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      ); // Navega a login
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera recursos de animación
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade700, // Fondo rojo institucional
      body: FadeTransition(
        opacity: _animation, // Aplica animación de opacidad
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Centra verticalmente
            children: [
              Icon(
                Icons.task_alt,
                size: 80,
                color: Colors.white,
              ), // Icono principal
              const SizedBox(height: 20), // Espacio vertical
              const Text(
                "App de Tareas IoT", // Título de la app
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
