import 'package:flutter/material.dart';
import 'package:dtree/models/user_model.dart';
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
        title: Text('Registration'),
        // backgroundColor: primaryColor, // Set app bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: roleController,
              decoration: InputDecoration(labelText: 'Role'),
            ),
            SizedBox(height: 16),
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
                  final success = await AuthService.registerUser(user);
                  if (success) {
                    // Registration successful, navigate to next screen
                  } else {
                    // Registration failed, show error message
                  }
                },
                color: primaryColor,
                textColor: Colors.white,
                child: Text('Register'),
              ),
            ),

            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/login'); 
              },
              child: RichText(
                text: TextSpan(
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
