import 'package:flutter/material.dart';
import 'package:dtree/main.dart';
import 'package:dtree/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        // backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Stretch content horizontally
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: primaryColor), // Line color when focused
                ),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: primaryColor),
                ),
              ),
            ),
            SizedBox(height: 16),
            MaterialButton(
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
              color: primaryColor, 
              textColor: Colors.white, 
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/register'); // Navigate to register screen
              },
              child: RichText(
                text: TextSpan(
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
