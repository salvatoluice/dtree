import 'package:dtree/main.dart';
import 'package:dtree/widgets/tabs/bookings_tab.dart';
import 'package:dtree/widgets/tabs/chats_tab.dart';
import 'package:dtree/widgets/tabs/cart_tab.dart';
import 'package:dtree/widgets/tabs/saved_tab.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              indicatorColor: primaryColor,
              labelColor: primaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Bookings'),
                Tab(text: 'Chats'),
                Tab(text: 'Cart'),
                Tab(text: 'Saved'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BookingsTab(),
                  ChatsTab(),
                  CartTab(),
                  SavedTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
