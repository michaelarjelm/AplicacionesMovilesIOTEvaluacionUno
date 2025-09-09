import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Importamos la pantalla de bienvenida

// Pantalla de Login Principal
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para los campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // Clave global para el formulario y validaciones
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login IOT',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 66, 60, 60), // Gris oscuro corporativo
        centerTitle: true,
      ),
      body: Container(
        // Fondo con gradiente sutil en grises
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey.shade100,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo o título de la aplicación
                Icon(
                  Icons.device_hub,
                  size: 80,
                  color: Color.fromARGB(255, 66, 60, 60),
                ),
                SizedBox(height: 20),
                Text(
                  'Aplicaciones Móviles para IOT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 66, 60, 60),
                  ),
                ),
                SizedBox(height: 40),

                // Campo de correo electrónico
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true, // Foco automático al abrir la pantalla
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    hintText: 'usuario@gmail.com',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 66, 60, 60)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color.fromARGB(255, 66, 60, 60), width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color.fromARGB(255, 66, 60, 60), width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color.fromARGB(255, 66, 60, 60), width: 2),
                    ),
                  ),
                  style: TextStyle(color: Color.fromARGB(255, 66, 60, 60)),
                  // Validación RF2: El correo debe ser de Gmail
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su correo electrónico';
                    }
                    if (!value.endsWith('@gmail.com')) {
                      return 'El correo debe ser de Gmail (@gmail.com)';
                    }
                    if (value.length <= '@gmail.com'.length) {
                      return 'Ingrese un nombre de usuario válido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo de contraseña
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    hintText: 'Mínimo 6 caracteres',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 66, 60, 60)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color.fromARGB(255, 66, 60, 60), width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color.fromARGB(255, 66, 60, 60), width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color.fromARGB(255, 66, 60, 60), width: 2),
                    ),
                  ),
                  style: TextStyle(color: Color.fromARGB(255, 66, 60, 60)),
                  // Validación RF3: La contraseña debe tener mínimo 6 caracteres
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),

                // Botón de ingreso (RF5)
                ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 66, 60, 60), // Gris oscuro corporativo
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'INGRESAR',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Información adicional
                Text(
                  'Tecnologías de Información y Ciberseguridad',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Función para manejar el proceso de login (RF1, RF4, RF5, RF6)
  void _handleLogin() {
    // Ejecutar validaciones del formulario
    if (_formKey.currentState!.validate()) {
      // Si las validaciones son correctas, navegar a pantalla de bienvenida
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(
            userEmail: _emailController.text,
          ),
        ),
      );
    }
    // Si las validaciones fallan, los mensajes de error se muestran automáticamente (RF4)
  }

  @override
  void dispose() {
    // Limpiar controladores para evitar memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}