import 'package:flutter/material.dart';
import 'package:dtree/main.dart';
import 'package:dtree/models/store.dart';
import 'package:dtree/services/store_service.dart';
import 'package:dtree/widgets/store_card.dart';


class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top stores | 2024', // Header text
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: primaryColor, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Search bar
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Color(0xFFE0E0E0)),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Handle search icon onPressed event
                      },
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Categories Container
              CategoriesContainer(),
              // Header and "See all" text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top stores | 2024', // Header text
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: primaryColor, // Use primaryColor for text color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Stores list
              StoresList(),
            ],
          ),
        ),
      ),
    );
  }
}



class CategoriesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CategoryItem(
            icon: Icons.local_offer,
            color: Colors.green[100]!,
            label: 'Discounts',
          ),
          CategoryItem(
            icon: Icons.store,
            color: Colors.red[100]!,
            label: 'Stores',
          ),
          CategoryItem(
            icon: Icons.card_giftcard,
            color: Colors.blue[100]!, 
            label: 'Coupons',
          ),
          CategoryItem(
            icon: Icons.vpn_key,
            color: Colors.orange[100]!, 
            label: 'Vouchers',
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const CategoryItem({
    Key? key,
    required this.icon,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class StoresList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Store>>(
      future: StoreService.fetchStores(),
      builder: (context, AsyncSnapshot<List<Store>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final List<Store> stores = snapshot.data!;
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.1,
              mainAxisSpacing: 2,
              childAspectRatio: 0.8,
            ),
            itemCount: stores.length >= 4
                ? 4
                : stores.length, 
            itemBuilder: (context, index) {
              return StoreCard(
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Store>>(
      future: StoreService.fetchStores(),
      builder: (context, AsyncSnapshot<List<Store>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final List<Store> stores = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: stores.length,
            itemBuilder: (context, index) {
              return StoreCard(
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