import 'dart:convert';

class Booking {
  final String discountName;
  final String storeName;
  final String time;
  final double initialPrice;
  final int discount;
  final double priceAfterDiscount;

  Booking({
    required this.discountName,
    required this.storeName,
    required this.time,
    required this.initialPrice,
    required this.discount,
    required this.priceAfterDiscount,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      discountName: json['discountName'] ?? '',
      storeName: json['storeName'] ?? '',
      time: json['time'] ?? '',
      initialPrice: json['initialPrice'] != null
          ? double.parse(json['initialPrice'].toString())
          : 0.0,
      discount: json['discount'] ?? 0,
      priceAfterDiscount: json['priceAfterDiscount'] != null
          ? double.parse(json['priceAfterDiscount'].toString())
          : 0.0,
    );
  }
}
