import 'store.dart';

class Discount {
  final String id;
  final String name;
  final int initialPrice;
  final int discount;
  final int priceAfterDiscount;
  final double percentageDiscount;
  final DateTime expiryDate;
  final String category;
  // final Store store;
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
    // required this.store,
    required this.serviceTime,
    required this.description,
    required this.imageUrl,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      id: json['_id'],
      name: json['name'],
      initialPrice: json['initialPrice'],
      discount: json['discount'],
      priceAfterDiscount: json['priceAfterDiscount'],
      percentageDiscount: json['percentageDiscount'].toDouble(),
      expiryDate: DateTime.parse(json['expiryDate']),
      category: json['category'],
      // store: Store.fromJson(json['store']),
      serviceTime: json['serviceTime'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}
