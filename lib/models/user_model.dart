// lib/models/user_model.dart

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String role;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
  });
}
