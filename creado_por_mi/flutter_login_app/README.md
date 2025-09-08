# Flutter Login App

This project is a simple Flutter application that demonstrates a login screen with email and password fields, basic validations, and a welcome screen that displays a personalized message upon successful login.

## Features

- Login screen with email and password fields
- Basic input validation for email format and password length
- Welcome screen that greets the user with their email

## Project Structure

```
flutter_login_app
├── lib
│   ├── main.dart                # Entry point of the application
│   ├── screens
│   │   ├── login_screen.dart    # Contains the login form
│   │   └── welcome_screen.dart   # Displays a welcome message
│   ├── widgets
│   │   └── custom_text_field.dart # Reusable text input field
│   └── utils
│       └── validators.dart       # Validation functions
├── pubspec.yaml                 # Project configuration
└── README.md                    # Project documentation
```

## Setup Instructions

1. Clone the repository or download the project files.
2. Navigate to the project directory.
3. Run `flutter pub get` to install the necessary dependencies.
4. Use `flutter run` to start the application on your device or emulator.

## Usage

- Open the app and navigate to the login screen.
- Enter your email and password.
- Upon successful login, you will be redirected to the welcome screen displaying a personalized message.