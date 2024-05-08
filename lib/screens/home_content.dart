import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
                      'dtree',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(1),
                          child: IconButton(
                            icon: Icon(Icons.settings),
                            color: Colors.black,
                            onPressed: () {
                              // Handle settings icon onPressed event
                            },
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(1),
                          child: IconButton(
                            icon: Icon(Icons.person),
                            color: Colors.black,
                            onPressed: () {
                              // Handle profile icon onPressed event
                            },
                          ),
                        ),
                      ],
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
          return ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(), // Added to allow pull-to-refresh
            children: [
              for (int index = 0; index < stores.length; index++)
                StoreCard(
                  name: stores[index].name,
                  storeType: stores[index].storeType,
                  imageUrl: stores[index].imageUrl,
                  onPressed: () {
                    // Handle onPressed event for this store
                  },
                ),
            ],
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