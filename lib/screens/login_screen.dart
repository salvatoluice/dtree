import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dtree/main.dart';
import 'package:dtree/services/auth_service.dart';
// ignore: unused_import
import 'package:dtree/models/user_model.dart';
import 'package:dtree/providers/auth_providers.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16),
            MaterialButton(
              onPressed: () async {
                final success = await AuthService.loginUser(
                  emailController.text,
                  passwordController.text,
                );
                if (success) {
                  final user = context.read(userProvider);
                  user.state = await AuthService.getUser(emailController.text);

                  final token = context.read(tokenProvider);
                  token.state = user.state?.token;

                  Navigator.pushNamed(context, '/home');
                } else {
                  // Show login failed message
                }
              },
              color: primaryColor,
              textColor: Colors.white,
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: RichText(
                text: const TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Register here',
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
