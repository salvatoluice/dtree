import 'package:flutter/material.dart';
import 'package:dtree/models/discount.dart';
import 'package:dtree/services/discount_service.dart';
import 'package:dtree/widgets/single_deal.dart';

class DiscountScreen extends StatefulWidget {
  @override
  _DiscountScreenState createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  late Future<List<Discount>> _futureDiscounts;

  @override
  void initState() {
    super.initState();
    _futureDiscounts = DiscountService.fetchDiscounts();
  }

  Future<void> _refreshDiscounts() async {
    setState(() {
      _futureDiscounts = DiscountService.fetchDiscounts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discounts'),
      ),
      backgroundColor: Colors.grey[100],
      body: RefreshIndicator(
        onRefresh: _refreshDiscounts,
        child: Padding(
          padding: const EdgeInsets.all(8.0), 
          child: FutureBuilder<List<Discount>>(
            future: _futureDiscounts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final discount = snapshot.data![index];
                    return SingleDeal(
                      id: discount.id,
                      imageUrl: discount.imageUrl,
                      name: discount.name,
                      priceAfterDiscount: discount.priceAfterDiscount,
                    );
                  },
                );
              } else {
                return const Center(child: Text('No discounts available.'));
              }
            },
          ),
        ),
      ),
    );
  }
}
