import 'package:dtree/models/owner.dart';
import 'package:dtree/models/store.dart'; // Import the Store class

class Discount {
  final String id;
  final String name;
  final int initialPrice;
  final int discount;
  final int priceAfterDiscount;
  final double percentageDiscount;
  final DateTime expiryDate;
  final String category;
  final Store store;
  final String serviceTime;
  final String description;
  final String imageUrl;

  Discount({
    required this.id,
    required this.name,
    required this.initialPrice,
    required this.discount,
    required this.priceAfterDiscount,
    required this.percentageDiscount,
    required this.expiryDate,
    required this.category,
    required this.store, 
    required this.serviceTime,
    required this.description,
    required this.imageUrl,
  });

factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      initialPrice: json['initialPrice'] ?? 0,
      discount: json['discount'] ?? 0,
      priceAfterDiscount: json['priceAfterDiscount'] ?? 0,
      percentageDiscount: (json['percentageDiscount'] ?? 0).toDouble(),
      expiryDate: DateTime.tryParse(json['expiryDate'] ?? '') ?? DateTime.now(),
      category: json['category'] ?? '',
      store: json['store'] != null
          ? Store.fromJson(json['store'])
          : Store(
              id: '',
              name: '',
              storeType: '',
              location: '',
              owner: Owner(
                  id: '', firstName: '', lastName: '', email: '', phone: ''),
              imageUrl: '',
              followers: 0),
      serviceTime: json['serviceTime'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

}
