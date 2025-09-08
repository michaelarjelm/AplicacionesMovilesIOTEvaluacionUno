import 'package:flutter/material.dart'; // Importa el framework de Flutter
import 'package:app_tareas/task_screen.dart'; // Importa la pantalla principal de tareas

class WelcomeSplash extends StatefulWidget {
  // Pantalla splash de bienvenida animada
  final String email; // Email del usuario autenticado
  const WelcomeSplash({super.key, required this.email});

  @override
  State<WelcomeSplash> createState() => _WelcomeSplashState();
}

class _WelcomeSplashState extends State<WelcomeSplash>
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

    Future.delayed(const Duration(seconds: 2), () {
      // Espera 2 segundos
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => TaskScreen(email: widget.email),
        ), // Navega a la pantalla de tareas
      );
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
      appBar: AppBar(
        title: const Text(
          "INICIO DE SESION | INACAP | Organizador de Tareas", // Título de la AppBar
          style: TextStyle(
            fontWeight: FontWeight.bold, // Negrita en el título
            fontSize: 26, // Tamaño grande
            letterSpacing: 2, // Espaciado entre letras
            color: Colors.white, // Color blanco
          ),
        ),
        backgroundColor: Colors.red, // Color institucional INACAP
      ),
      backgroundColor: Colors.red.shade700, // Fondo rojo institucional
      body: FadeTransition(
        opacity: _animation, // Aplica animación de opacidad
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Centra verticalmente
            children: [
              const Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ), // Icono de usuario
              const SizedBox(height: 20), // Espacio vertical
              Text(
                "Bienvenido ${widget.email}", // Mensaje personalizado de bienvenida
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center, // Centra el texto
              ),
            ],
          ),
        ),
      ),
    );
  }
}
