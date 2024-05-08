// lib/main.dart

import 'package:flutter/material.dart';
import 'package:dtree/screens/registration_screen.dart';
import 'package:dtree/screens/login_screen.dart';

const Color primaryColor = Color(0xFFD83A3E);
const Color secondaryColor = Color(0xFFFDEDEE);
const Color fastColor = Color(0xFF1E2023);
const Color thirdColor = Color(0xFFFF9021);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dtree',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/register': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
