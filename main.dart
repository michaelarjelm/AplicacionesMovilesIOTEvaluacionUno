import 'package:flutter/material.dart';

void main() {
  runApp(const AuroraApp());
}

class AuroraApp extends StatelessWidget {
  const AuroraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aurora IoT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// ------------------ PANTALLA DE LOGIN ------------------

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para obtener el texto ingresado por el usuario
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Key para asociar el Form y validar sus campos
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Estado local para mostrar un indicador de carga mientras "autenticamos"
  bool _isLoading = false;

  @override
  void dispose() {
    // Limpiar los controladores cuando el Widget se elimine
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Función que simula la autenticación con 5 segundos de carga
  Future<void> _simulateLogin() async {
    // Si el formulario no es válido, no continuar
    if (!_formKey.currentState!.validate()) return;

    // Mostrar indicador de carga
    setState(() {
      _isLoading = true;
    });

    // Esperar 5 segundos para simular la carga
    await Future.delayed(const Duration(seconds: 5));

    // Detener indicador de carga
    setState(() {
      _isLoading = false;
    });

    // Navegar a la pantalla de bienvenida, reemplazando la pantalla de login
    // Pasamos el correo ingresado para mostrarlo en la pantalla de bienvenida
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => WelcomeScreen(email: _emailController.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold representa la estructura básica visual de la pantalla
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aurora IoT - Inicio de Sesión'),
        centerTitle: true,
      ),
      body: AuroraBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Bienvenido a Aurora',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      color: Colors.white24,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Plataforma de pruebas para dispositivos IoT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      color: Colors.white24,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        hintText: 'usuario@dominio.com',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        final v = value?.trim() ?? '';
                        if (v.isEmpty) return 'Ingrese su correo electrónico';
                        if (!v.contains('@')) {
                          return 'El correo debe contener "@"';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        hintText: 'Al menos 6 caracteres',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        final v = value ?? '';
                        if (v.isEmpty) return 'Ingrese su contraseña';
                        if (v.length < 6) {
                          return 'La contraseña debe tener al menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _simulateLogin,
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              )
                            : const Text('Ingresar'),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------ PANTALLA DE BIENVENIDA ------------------

class WelcomeScreen extends StatelessWidget {
  // Recibe el correo del usuario autenticado para mostrarlo en el saludo.
  final String email;

  const WelcomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aurora IoT - Bienvenida'),
        centerTitle: true,
      ),
      body: AuroraBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '¡Bienvenido, $email!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 2,
                        color: Colors.white24,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Has iniciado sesión correctamente en Aurora IoT.\nAquí puedes simular la conexión de tus dispositivos.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 2,
                        color: Colors.white24,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: const Text('Cerrar sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuroraBackground extends StatelessWidget {
  final Widget child;
  const AuroraBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                Colors.white.withOpacity(0.55),
                Colors.white.withOpacity(0.35),
              ],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
