// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:dtree/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final success = await AuthService.loginUser(
                  emailController.text,
                  passwordController.text,
                );
                if (success) {
                  // Login successful, navigate to next screen
                } else {
                  // Login failed, show error message
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
