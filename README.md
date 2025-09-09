# Evaluación 1: Aplicación de Login en Flutter

Este proyecto es una aplicación móvil básica desarrollada en Flutter como parte de la Evaluación Sumativa N°1 para el módulo de **Aplicaciones Móviles para IoT**. La aplicación simula una pantalla de inicio de sesión con validación de campos y navega a una pantalla de bienvenida tras una autenticación exitosa.

## Enlace al Repositorio

Puedes ver el código fuente y la estructura del proyecto en el siguiente repositorio de GitHub:

[Ver el repositorio en GitHub](https://github.com/michaelarjelm/AplicacionesMovilesIOTEvaluacionUno)

## Información del Curso

* **Estudiante:** Adilen Reyes
* **Docente:** Michael Alexis Arjel Mayerovich
* **Asignatura:** Aplicaciones Móviles para IoT
* **Sección:** 103-4A-F1/V
* **Institución:** Inacap, Sede Puente Alto

## Requerimientos Cumplidos

El proyecto cumple con todos los requerimientos funcionales y no funcionales solicitados en la pauta de evaluación:

* [x] **RF1 - Autenticación Simulada:** El sistema permite el ingreso de un correo y contraseña.
* [x] **RF2 - Validación de Correo:** El campo de correo valida que el texto ingresado contenga el carácter `@`.
* [x] **RF3 - Validación de Contraseña:** El campo de contraseña valida que el texto tenga un mínimo de 6 caracteres.
* [x] **RF4 - Mensajes de Error:** El sistema muestra mensajes de error claros cuando las validaciones no se cumplen.
* [x] **RF5 - Botón de Ingreso:** Un botón funcional ejecuta la lógica de validación de los campos.
* [x] **RF6 - Navegación a Pantalla de Bienvenida:** Si la validación es exitosa, el sistema redirige al usuario a una nueva pantalla.
* [x] **RF7 - Mensaje de Bienvenida Personalizado:** La pantalla de bienvenida muestra un saludo que incluye el correo del usuario autenticado.
* [x] **RF9 - Estilo Corporativo:** La aplicación utiliza el color rojo corporativo de INACAP en elementos como la `AppBar` y botones para mantener una consistencia visual.

## Tecnologías Utilizadas

* **Flutter:** Framework principal para el desarrollo de la aplicación.
* **Dart:** Lenguaje de programación utilizado por Flutter.
* **Git y GitHub:** Para el control de versiones y la entrega del proyecto.

## Cómo Ejecutar el Proyecto

1.  **Clonar el repositorio** (o tener los archivos del proyecto).
2.  **Abrir una terminal** en la carpeta raíz del proyecto.
3.  **Obtener las dependencias** de Flutter:
    ```bash
    flutter pub get
    ```
4.  **Ejecutar la aplicación**. Puedes elegir el dispositivo (un emulador o Chrome para la web):
    ```bash
    flutter run
    ```
    O para ejecutar en Chrome:
    ```bash
    flutter run -d chrome
    ```



**Pantalla de Bienvenida**

![Welcome Screen](URL_DE_TU_IMAGEN_DE_BIENVENIDA)
