import 'package:dtree/main.dart';
import 'package:dtree/screens/single_discount_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleDeal extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final int priceAfterDiscount;

  const SingleDeal({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.priceAfterDiscount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/deal_details', arguments: id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Center(
                child: SizedBox(
                  width: 60, 
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.length > 20 ? '${name.substring(0, 13)}...' : name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1, // Limit to a single line
                    overflow:
                        TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Kes. ${NumberFormat('#,##0').format(priceAfterDiscount)}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SingleDiscountScreen(discountId: id),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: primaryColor),
                      ),
                      minimumSize: const Size(120, 36),
                      backgroundColor: primaryColor,
                    ),
                    child: const Text(
                      'Details',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
