# Aplicación Móvil IOT - Login y Bienvenida

Una aplicación Flutter que simula un sistema de autenticación para dispositivos IOT, desarrollada como parte de la evaluación sumativa del módulo "Aplicaciones Móviles para IOT".

## Descripción

Esta aplicación implementa un sistema de login básico con validaciones específicas y navegación hacia una pantalla de bienvenida personalizada. Está diseñada para demostrar los fundamentos de Flutter en el contexto de aplicaciones para Internet of Things (IOT).

## Características Principales

### Funcionalidades Implementadas

- **Pantalla de Login**: Formulario con campos de correo electrónico y contraseña
- **Validaciones Específicas**:
  - Correo debe terminar en `@gmail.com`
  - Contraseña mínima de 6 caracteres
  - Mensajes de error automáticos
- **Pantalla de Bienvenida**: Mensaje personalizado con el correo del usuario
- **Navegación**: Transición fluida entre pantallas
- **Diseño Responsivo**: Interfaz adaptable en escala de grises

### Requerimientos Cumplidos

- **RF1**: Autenticación simulada con correo y contraseña
- **RF2**: Validación de formato de correo Gmail
- **RF3**: Validación de contraseña (mínimo 6 caracteres)
- **RF4**: Mensajes de error en pantalla
- **RF5**: Botón de ingreso funcional
- **RF6**: Navegación a pantalla de bienvenida
- **RF7**: Mensaje personalizado con correo del usuario
- **RF9**: Estilo corporativo consistente en escala de grises

## Estructura del Proyecto

```
lib/
├── main.dart              # Configuración principal de la aplicación
├── login_screen.dart      # Pantalla de autenticación
└── welcome_screen.dart    # Pantalla de bienvenida
```

## Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo multiplataforma
- **Dart**: Lenguaje de programación
- **Material Design**: Sistema de diseño de Google

## Instalación y Ejecución

### Prerrequisitos

- Flutter SDK instalado
- Android Studio o VS Code con extensiones de Flutter
- Emulador Android o dispositivo físico

### Pasos para ejecutar

1. **Clonar el repositorio**
   ```bash
   git clone [URL_DEL_REPOSITORIO]
   cd aplicacion_iot_login
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Verificar configuración**
   ```bash
   flutter doctor
   ```

4. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

## Uso de la Aplicación

### Pantalla de Login

1. Ingresar un correo electrónico válido que termine en `@gmail.com`
2. Ingresar una contraseña de al menos 6 caracteres
3. Presionar el botón "INGRESAR"
4. Si las validaciones son correctas, se navegará a la pantalla de bienvenida

### Pantalla de Bienvenida

- Muestra un mensaje de bienvenida personalizado
- Incluye el correo electrónico del usuario autenticado
- Botón para regresar a la pantalla de login

## Características Técnicas

### Validaciones

- **Correo electrónico**: Debe contener exactamente `@gmail.com` al final
- **Contraseña**: Mínimo 6 caracteres, sin restricciones adicionales
- **Campos obligatorios**: Ambos campos son requeridos

### Diseño

- **Paleta de colores**: Escala de grises con color corporativo `Color.fromARGB(255, 66, 60, 60)`
- **Gradientes**: Fondo degradado de gris claro a blanco
- **Tipografía**: Material Design con diferentes pesos y tamaños
- **Iconografía**: Íconos relacionados con IOT y dispositivos

### Arquitectura

- **StatefulWidget**: Para la pantalla de login con estado mutable
- **StatelessWidget**: Para la pantalla de bienvenida
- **Controladores**: Gestión de campos de texto con dispose apropiado
- **Formularios**: Validación automática con GlobalKey

## Casos de Uso

### Credenciales Válidas
```
Correo: usuario@gmail.com
Contraseña: 123456
Resultado: Acceso exitoso a pantalla de bienvenida
```

### Credenciales Inválidas
```
Correo: usuario@yahoo.com
Contraseña: 123
Resultado: Mensajes de error mostrados
```

## Desarrollo

### Estructura de Código

- **main.dart**: Configuración del tema y punto de entrada
- **login_screen.dart**: Lógica de autenticación y validaciones
- **welcome_screen.dart**: Interfaz de bienvenida

### Buenas Prácticas Implementadas

- Dispose de controladores para prevenir memory leaks
- Separación de responsabilidades en archivos diferentes
- Comentarios explicativos en código
- Validaciones robustas de entrada
- Manejo consistente de estilos

## Información Académica

- **Institución**: INACAP
- **Carrera**: Analista programador
- **Módulo**: Aplicaciones Móviles para IOT
- **Evaluación**: Sumativa N°1 (20% de ponderación)
- **Área**: Tecnologías de Información y Ciberseguridad

## Autor

Desarrollado como proyecto académico para la evaluación del módulo "Aplicaciones Móviles para IOT".

## Licencia

Este proyecto es de uso académico.
