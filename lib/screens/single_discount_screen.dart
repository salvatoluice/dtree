import 'package:flutter/material.dart';
import 'package:dtree/services/single_discount_service.dart';
import 'package:dtree/main.dart';

import 'package:intl/intl.dart';

class SingleDiscountScreen extends StatefulWidget {
  final String discountId;

  const SingleDiscountScreen({Key? key, required this.discountId})
      : super(key: key);

  @override
  _SingleDiscountScreenState createState() => _SingleDiscountScreenState();
}

class _SingleDiscountScreenState extends State<SingleDiscountScreen> {
  late Future<Map<String, dynamic>> _discountDataFuture;

  @override
  void initState() {
    super.initState();
    _refreshDiscountData();
  }

  Future<void> _refreshDiscountData() async {
    setState(() {
      _discountDataFuture =
          SingleDiscountService.fetchDiscount(widget.discountId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discount Details'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshDiscountData,
        child: FutureBuilder<Map<String, dynamic>>(
          future: _discountDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final discountData = snapshot.data!;
              final percentageDiscount =
                  double.parse(discountData['percentageDiscount'].toString());
              final formattedPercentageDiscount = percentageDiscount
                  .toStringAsFixed(0); // Rounded percentage discount

              final initialPrice = NumberFormat('#,##0').format(
                  double.parse(discountData['initialPrice'].toString()));
              final priceAfterDiscount = NumberFormat('#,##0').format(
                  double.parse(discountData['priceAfterDiscount'].toString()));
              final discount = NumberFormat('#,##0')
                  .format(double.parse(discountData['discount'].toString()));

              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: secondaryColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              discountData['imageUrl'],
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              discountData['name'],
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$formattedPercentageDiscount% OFF',
                              style: const TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Text(
                                  'was ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'Ksh $initialPrice',
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'now ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Ksh $priceAfterDiscount',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Text(
                                  'Save ',
                                  style: TextStyle(
                                      color: thirdColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'Ksh $discount',
                                  style: const TextStyle(
                                      color: thirdColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                backgroundColor: primaryColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 9),
                                minimumSize: const Size(double.infinity, 40),
                              ),
                              child: const Text(
                                'Get This Discount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Save this for later',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: const BorderSide(color: Colors.grey),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Favorite',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Share with friends and family',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // Implement Facebook share functionality
                                  },
                                  icon: Icon(Icons.facebook),
                                  color: Colors.blue,
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Implement Instagram share functionality
                                  },
                                  icon: Icon(Icons.facebook),
                                  color: Colors.pink,
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Implement Twitter share functionality
                                  },
                                  icon: Icon(Icons.share),
                                  color: Colors.lightBlue,
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Implement WhatsApp share functionality
                                  },
                                  icon: Icon(Icons.share),
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              discountData['description'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Submit a review',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // ignore: sized_box_for_whitespace
                            Container(
                              height: 40,
                              child: const TextField(
                                decoration: InputDecoration(
                                  labelText: 'Your Name',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Your Review',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 3,
                            ),
                            const SizedBox(height: 16),
                             ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                backgroundColor: primaryColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 9),
                                minimumSize: const Size(double.infinity, 40),
                              ),
                              child: const Text(
                                'Submit Review',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
