class Store {
  final String id;
  final String name;
  final String storeType;
  final String location;
  final Owner owner;
  final String imageUrl;
  final int followers;

  Store({
    required this.id,
    required this.name,
    required this.storeType,
    required this.location,
    required this.owner,
    required this.imageUrl,
    required this.followers,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['_id'],
      name: json['name'],
      storeType: json['storeType'],
      location: json['location'],
      owner: Owner.fromJson(json['owner']),
      imageUrl: json['imageUrl'],
      followers: json['followers'],
    );
  }
}

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
