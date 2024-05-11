import 'package:dtree/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:dtree/main.dart';
import 'package:dtree/models/store.dart';
import 'package:dtree/services/store_service.dart';
import 'package:dtree/widgets/store_card.dart';
import 'package:dtree/widgets/store_card_skeleton.dart';
import 'package:dtree/widgets/discount_card_skeleton.dart';
import 'package:dtree/widgets/discount_card.dart';
import 'package:dtree/models/discount.dart';
import 'package:dtree/services/discount_service.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  Future<void> _refreshData() async {
    // Implement logic to refresh data here
    // For example:
    // await StoreService.fetchStores();
    // await DiscountService.fetchDiscounts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'd-tree',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.all(1),
                            child: IconButton(
                              icon: const Icon(Icons.person),
                              color: Colors.black,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()),
                                );
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
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          // Handle search icon onPressed event
                        },
                      ),
                      const Expanded(
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
                // Your existing content here...
                // Categories Container
                const CategoriesContainer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
            // Wrap with SingleChildScrollView
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
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      padding: const EdgeInsets.all(16),
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
          padding: const EdgeInsets.all(12),
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
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 0.8,
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
                id: stores[index].id, // Pass the store ID
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
              id: stores[index].id, // Pass the store ID
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
