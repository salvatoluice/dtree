import 'package:flutter/material.dart';
import 'package:dtree/services/single_discount_service.dart';

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
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      discountData['name'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Initial Price: \$${discountData['initialPrice']}'),
                    Text('Discount: \$${discountData['discount']}'),
                    Text(
                        'Price After Discount: \$${discountData['priceAfterDiscount']}'),
                    Text(
                        'Percentage Discount: ${discountData['percentageDiscount']}%'),
                    Text('Expiry Date: ${discountData['expiryDate']}'),
                    Text('Category: ${discountData['category']}'),
                    Text('Service Time: ${discountData['serviceTime']}'),
                    Text('Description: ${discountData['description']}'),
                    Image.network(discountData['imageUrl']),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
