import 'package:flutter/material.dart';
import 'package:dtree/models/store.dart';
import 'package:dtree/widgets/store_card_skeleton.dart';
import 'package:dtree/services/store_service.dart';
import 'package:dtree/widgets/store_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () =>
              StoreService.fetchStores(), // Call fetchStores when refreshing
          child: SingleChildScrollView(
            physics:
                const AlwaysScrollableScrollPhysics(),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[50],
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Stores with cashbacks, Coupon Codes & Promo Codes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Get Extra 5% Bonus at over 1000 stores',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Double Cash Back Event Featured Stores | 2024:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  StoresList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StoresList extends StatelessWidget {
  const StoresList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Store>>(
      future: StoreService.fetchStores(),
      builder: (context, AsyncSnapshot<List<Store>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 0.8,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return StoreCardSkeleton();
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final List<Store> stores = snapshot.data!;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            itemCount: stores.length,
            itemBuilder: (context, index) {
              return StoreCard(
                id: stores[index].id,
                name: stores[index].name,
                storeType: stores[index].storeType,
                imageUrl: stores[index].imageUrl,
                onPressed: () {
                  // Handle onPressed event for this store
                },
              );
            },
          );
        }
      },
    );
  }
}
