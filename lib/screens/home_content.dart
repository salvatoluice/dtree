import 'dart:convert';
import 'package:dtree/screens/settings_screen.dart';
import 'package:dtree/widgets/image_corousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:dtree/main.dart';
import 'package:dtree/screens/profile_screen.dart';
import 'package:dtree/models/store.dart';
import 'package:dtree/services/store_service.dart';
import 'package:dtree/widgets/store_card.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dtree/widgets/store_card_skeleton.dart';
import 'package:dtree/widgets/discount_card_skeleton.dart';
import 'package:dtree/widgets/discount_card.dart';
import 'package:dtree/models/discount.dart';
import 'package:dtree/services/discount_service.dart';

class HomeContent extends StatefulWidget {
  final Map<String, dynamic> userData;

  const HomeContent({Key? key, required this.userData}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  Future<void> _refreshData() async {
    await StoreService.fetchStores();
    await DiscountService.fetchDiscounts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 8),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 110,
                        child: Image.asset('assets/logo1.png'),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.settings,
                                  size: 20), 
                              color: Colors.black,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingsPage()),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.person,
                                  size: 20),
                              color: Colors.black,
                              onPressed: () async {
                                const storage = FlutterSecureStorage();
                                final userDataString =
                                    await storage.read(key: 'userData');

                                if (userDataString != null) {
                                  final userData = jsonDecode(userDataString);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProfileScreen(userData: userData),
                                    ),
                                  );
                                } else {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/login',
                                  );
                                }
                              },
                            ),
                          ),
                        ],

                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Search bar
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search on d-tree...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 20.0),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search, color: Colors.grey),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                const ImageCarouselWidget(
                  imageUrls: [
                    'https://fatcoupon.com/_next/image?url=https%3A%2F%2Fd3itvsmwj0r86k.cloudfront.net%2Fimages%2F1ef4b6d8-f46b-4465-8e1b-acaebd8d8c31.png&w=1920&q=75',
                    'https://fatcoupon.com/_next/image?url=https%3A%2F%2Fd3itvsmwj0r86k.cloudfront.net%2Fimages%2F2c4aa157-ece8-41f7-ac3a-62b379157f98.webp&w=1920&q=75',
                    'https://fatcoupon.com/_next/image?url=https%3A%2F%2Fd3itvsmwj0r86k.cloudfront.net%2Fimages%2F577dde1b-734a-4c1e-9489-410f5d17bae8.webp&w=1920&q=75',
                    'https://fatcoupon.com/_next/image?url=https%3A%2F%2Fd3itvsmwj0r86k.cloudfront.net%2Fimages%2F1f0cc785-d79d-4232-93db-016072562ded.webp&w=1920&q=75'
                  ],
                ),
                
                const CategoriesContainer(),
                const Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top stores | 2024',
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
                // Stores list
                const StoresList(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top discounts | 2024',
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
                const DiscountList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DiscountList extends StatelessWidget {
  const DiscountList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Discount>>(
      future: DiscountService.fetchDiscounts(),
      builder: (context, AsyncSnapshot<List<Discount>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const DiscountCardSkeleton();
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final List<Discount> discounts = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), 
                  itemCount: discounts.length > 6 ? 6 : discounts.length,
                  itemBuilder: (context, index) {
                    return DiscountCard(
                      discount: discounts[index],
                      onSeeDetailsPressed: () {
                        // Handle see details onPressed event
                      },
                      onGetDiscountPressed: () {
                        // Handle get discount onPressed event
                      },
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(vertical : 16),
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
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(12),
          child: Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
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
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.6,
            ),
            itemCount: 4,
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
              crossAxisSpacing: 0.1,
              mainAxisSpacing: 2,
              childAspectRatio: 0.8,
            ),
            itemCount: stores.length >= 4 ? 4 : stores.length,
            itemBuilder: (context, index) {
              return StoreCard(
                id: stores[index].id,
                name: stores[index].name,
                storeType: stores[index].storeType,
                imageUrl: stores[index].imageUrl,
                onPressed: () {
                 
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
        return ListView.builder(
          shrinkWrap: true,
          itemCount: 4, 
          itemBuilder: (context, index) {
            return const DiscountCardSkeleton(); 
          },
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
