class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String role;
  String token;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
    this.token = '', // Make token optional with a default value
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      role: json['role'],
      token: json['token'] ??
          '', // Set token from JSON, defaulting to empty string if not provided
    );
  }
}
