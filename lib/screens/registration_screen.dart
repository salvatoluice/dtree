import 'package:dtree/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:dtree/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dtree/services/auth_service.dart';
import 'package:dtree/main.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: roleController,
              decoration: const InputDecoration(labelText: 'Role'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () async {
                  final user = User(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    password: passwordController.text,
                    role: roleController.text,
                  );

                  // Obtain the token from context
                  final token = context.read(tokenProvider);

                  final success = await AuthService.registerUser(user, token as String);
                  if (success) {
                    // Registration successful, navigate to next screen
                  } else {
                    // Registration failed, show error message
                  }
                },
                color: primaryColor,
                textColor: Colors.white,
                child: const Text('Register'),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: RichText(
                text: const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Login here',
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
