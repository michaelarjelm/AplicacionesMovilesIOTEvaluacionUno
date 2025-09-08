import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const Color inacapRed = Color(0xFFB30000);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evaluación Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: inacapRed,
        appBarTheme: AppBarTheme(
          backgroundColor: inacapRed,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: inacapRed,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
