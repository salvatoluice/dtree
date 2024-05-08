// lib/services/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dtree/models/user_model.dart';

class AuthService {
  static Future<bool> registerUser(User user) async {
    final url = 'https://your-api-domain.com/register';
    final response = await http.post(Uri.parse(url), body: {
      'first_name': user.firstName,
      'last_name': user.lastName,
      'email': user.email,
      'phone': user.phone,
      'password': user.password,
      'role': user.role,
    });
    final responseData = json.decode(response.body);
    return responseData['success'];
  }

  static Future<bool> loginUser(String email, String password) async {
    final url = 'https://your-api-domain.com/login';
    final response = await http.post(Uri.parse(url), body: {
      'email': email,
      'password': password,
    });
    final responseData = json.decode(response.body);
    return responseData['success'];
  }
}
