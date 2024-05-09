import 'package:flutter/material.dart';
import 'package:dtree/main.dart';
import 'package:dtree/models/discount.dart';
import 'package:dtree/screens/single_discount_screen.dart';
import 'package:intl/intl.dart';

class DiscountCard extends StatelessWidget {
  final Discount discount;
  final VoidCallback onSeeDetailsPressed;
  final VoidCallback onGetDiscountPressed;

  const DiscountCard({
    Key? key,
    required this.discount,
    required this.onSeeDetailsPressed,
    required this.onGetDiscountPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (discount.imageUrl != null)
            Image.network(
              discount.imageUrl!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
          else
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[200],
              child: Icon(Icons.image, color: Colors.grey),
            ),
          SizedBox(height: 16),
          Text(
            discount.name ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${discount.initialPrice != null ? '${discount.initialPrice!.toStringAsFixed(2)}' : ''}',
                style: TextStyle(
                  color: Colors.grey[500],
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                '${discount.priceAfterDiscount != null ? 'KES ${discount.priceAfterDiscount!.toStringAsFixed(2)}' : ''}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                'save ${discount.percentageDiscount != null ? '${discount.percentageDiscount!.toStringAsFixed(2)}%' : ''}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Expires ${discount.expiryDate != null ? DateFormat('yyyy-MM-dd').format(discount.expiryDate!) : ''}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SingleDiscountScreen(
                        discountId: discount
                            .id), 
                  ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: thirdColor),
                  ),
                  minimumSize: Size(120, 36),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'See Details',
                  style: TextStyle(color: thirdColor),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: onGetDiscountPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(120, 36),
                  backgroundColor: primaryColor,
                ),
                child: Text(
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
