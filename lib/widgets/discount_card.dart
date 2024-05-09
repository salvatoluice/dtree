// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../main.dart';
import '../../models/discount.dart';
import '../../screens/single_discount_screen.dart';
import '../../screens/checkout_screen.dart';

class DiscountCard extends StatelessWidget {
  final Discount discount;
  final VoidCallback onSeeDetailsPressed;
  final VoidCallback onGetDiscountPressed;

  const DiscountCard({
    super.key,
    required this.discount,
    required this.onSeeDetailsPressed,
    required this.onGetDiscountPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            discount.imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Text(
            discount.name ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                discount.initialPrice != null
                    ? discount.initialPrice.toStringAsFixed(2)
                    : '',
                style: TextStyle(
                  color: Colors.grey[500],
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                discount.priceAfterDiscount != null
                    ? 'KES ${discount.priceAfterDiscount.toStringAsFixed(2)}'
                    : '',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                'save ${discount.percentageDiscount != null ? '${discount.percentageDiscount.toStringAsFixed(2)}%' : ''}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Expires ${discount.expiryDate != null ? DateFormat('yyyy-MM-dd').format(discount.expiryDate) : ''}',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SingleDiscountScreen(discountId: discount.id),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: thirdColor),
                  ),
                  minimumSize: const Size(120, 36),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'See Details',
                  style: TextStyle(color: thirdColor),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CheckoutScreen(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(120, 36),
                  backgroundColor: primaryColor,
                ),
                child: const Text(
                  'Get Discount',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
