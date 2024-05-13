import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserData {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String role;
  final String token;

  UserData({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.role,
    required this.token,
  });
}

final userDataProvider = StateProvider<UserData?>((ref) => null);
