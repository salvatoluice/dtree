// auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dtree/models/user_model.dart';

class AuthService {
  static Future<bool> loginUser(String email, String password) async {
    try {
      const url = 'https://d3-api.onrender.com/api/v1/users/login';
      final response = await http.post(Uri.parse(url), body: {
        'email': email,
        'password': password,
      });
      final responseData = json.decode(response.body);

      if (responseData['success']) {
        final user = User.fromJson(responseData['user']);
        final token = responseData['token'] as String;

        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  static Future<bool> registerUser(User user, String token) async {
    const url = 'https://d3-api.onrender.com/api/v1/users/register';
    final response = await http.post(Uri.parse(url), body: {
      'first_name': user.firstName,
      'last_name': user.lastName,
      'email': user.email,
      'phone': user.phone,
      'password': user.password,
      'role': user.role,
      'token': token,
    });
    final responseData = json.decode(response.body);
    return responseData['success'];
  }


}
