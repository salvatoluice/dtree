import 'package:flutter/material.dart';

class StoreDiscountCard extends StatelessWidget {
  final String discountName;
  final int initialPrice;
  final int discount;
  final int priceAfterDiscount;
  final double percentageDiscount;
  final String expiryDate;
  final String category;
  final String serviceTime;
  final String description;
  final String imageUrl;

  const StoreDiscountCard({
    super.key,
    required this.discountName,
    required this.initialPrice,
    required this.discount,
    required this.priceAfterDiscount,
    required this.percentageDiscount,
    required this.expiryDate,
    required this.category,
    required this.serviceTime,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  discountName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Initial Price: Ksh $initialPrice',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Discount: Ksh $discount',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Price After Discount: Ksh $priceAfterDiscount',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Percentage Discount: ${percentageDiscount.toStringAsFixed(2)}%',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Expiry Date: $expiryDate',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Category: $category',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Service Time: $serviceTime',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Description: $description',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
