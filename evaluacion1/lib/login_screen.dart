import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Detecta si el teclado está abierto, para ajustar la UI
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      //scaffold sirve para crear la estructura basica de la app
      appBar: AppBar(
        title: const Text("Login - INACAP"),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse:
              true, // hace que el scroll empuje hacia arriba cuando aparece el teclado
          child: Padding(
            padding: const EdgeInsets.all(
              20.0,
            ), // padding alrededor del formulario
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Imagen que se ajusta al aparecer el teclado
                  AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 300,
                    ), // animación suave
                    height:
                        isKeyboardOpen // Tenía problemas con que el teclado cubria lo que se escribia en el campo de texto
                        ? 100
                        : 150, // se achica si teclado abierto, empujando el formulario hacia arriba
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ), // Logo de la app, boxfit.contain para que se ajuste bien
                  ),
                  const SizedBox(height: 20),
                  // Campo correo
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Correo electrónico",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese su correo";
                      }
                      if (!value.contains('@')) {
                        return "El correo debe contener @";
                      }
                      if (!value.contains('.')) {
                        return "El correo debe contener un dominio (.)";
                      }
                      String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return "Ingrese un correo válido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  // Campo contraseña
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese su contraseña";
                      }
                      if (value.length < 6) {
                        return "La contraseña debe tener al menos 6 caracteres";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            );
                          },
                        );
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pop(context);
                          Navigator.pushNamed(
                            context,
                            '/welcome',
                            arguments: _emailController.text,
                          );
                        });
                      }
                    },
                    child: const Text("Ingresar"),
                  ),
                  SizedBox(
                    height: isKeyboardOpen ? 20 : 0,
                  ), // espacio extra cuando teclado
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
