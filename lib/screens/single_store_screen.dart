import 'package:flutter/material.dart';
import 'package:dtree/services/single_store_service.dart';
import '../../widgets/discount_card.dart';
import 'package:dtree/models/discount.dart';
import 'package:dtree/services/single_store_discount_service.dart';

class SingleStoreScreen extends StatefulWidget {
  final String storeId;

  const SingleStoreScreen({super.key, required this.storeId});

  @override
  _SingleStoreScreenState createState() => _SingleStoreScreenState();
}

class _SingleStoreScreenState extends State<SingleStoreScreen> {
  late Future<Map<String, dynamic>> _storeDataFuture;
  late Future<List<dynamic>> _discountsFuture;

  @override
  void initState() {
    super.initState();
    _fetchStoreData();
    _fetchDiscounts();
  }

  Future<void> _fetchStoreData() async {
    setState(() {
      _storeDataFuture = SingleStoreService.fetchStore(widget.storeId);
    });
  }

  Future<void> _fetchDiscounts() async {
    setState(() {
      _discountsFuture = DiscountService.fetchDiscountsForShop(widget.storeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Details'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _storeDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final storeData = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          10.0), // adjust the radius as needed
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: NetworkImage(storeData['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  storeData['name'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${storeData['storeType']}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${storeData['location']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.phone),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${storeData['owner']['phone']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                    'All Discounts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),),
                  
                  const SizedBox(height: 16),
                  FutureBuilder<List<dynamic>>(
                    future: _discountsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        final discounts = snapshot.data!;
                        if (discounts.isEmpty) {
                          return const Center(
                            child:
                                Text('No discounts available at the moment.'),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: discounts.map<Widget>((discount) {
                            return DiscountCard(
                              discount: Discount.fromJson(discount),
                              onSeeDetailsPressed: () {
                                // Handle see details button pressed
                              },
                              onGetDiscountPressed: () {
                                // Handle get discount button pressed
                              },
                            );
                          }).toList(),
                        );
                      }
                    },
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
