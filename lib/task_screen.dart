import 'package:flutter/material.dart'; // Importa el framework de Flutter

class TaskScreen extends StatelessWidget {
  // Pantalla principal de tareas
  final String email; // Email del usuario autenticado
  const TaskScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MENÚ PRINCIPAL | INACAP | Organizador de Tareas", // Título de la AppBar
          style: TextStyle(
            fontWeight: FontWeight.bold, // Negrita en el título
            fontSize: 26, // Tamaño grande
            letterSpacing: 2, // Espaciado entre letras
            color: Colors.white, // Color blanco
          ),
        ),
        backgroundColor: Colors.red, // Color institucional INACAP
      ),
      body: Center(
        // Centra el contenido en la pantalla
        child: Padding(
          padding: const EdgeInsets.all(24), // Espaciado interno
          child: Column(
            mainAxisSize: MainAxisSize.min, // Solo ocupa el espacio necesario
            children: [
              Text(
                "Bienvenido $email", // Mensaje personalizado de bienvenida
                style: const TextStyle(
                  fontSize: 24, // Tamaño de fuente grande
                  fontWeight: FontWeight.bold, // Negrita
                ),
                textAlign: TextAlign.center, // Centra el texto
              ),
              const SizedBox(height: 32), // Espacio vertical
              ElevatedButton.icon(
                icon: const Icon(Icons.add_task), // Icono de agregar tarea
                label: const Text("Agregar tarea"), // Texto del botón
                onPressed: () {
                  showDialog(
                    context: context, // Contexto actual
                    builder: (_) => AlertDialog(
                      title: const Text("Agregar tarea"), // Título del diálogo
                      content: const Text(
                        "Aquí puedes agregar una nueva tarea.", // Mensaje del diálogo
                      ),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.of(context).pop(), // Cierra el diálogo
                          child: const Text(
                            "Cerrar",
                          ), // Texto del botón de cerrar
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
