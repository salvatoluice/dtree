class Owner {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  Owner({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
