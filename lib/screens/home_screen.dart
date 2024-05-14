import 'package:dtree/screens/discount_screen.dart';
import 'package:dtree/screens/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:dtree/main.dart';
import 'package:dtree/screens/home_content.dart';
import 'package:dtree/screens/store_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(userData: {},),
    DiscountScreen(),
    const StoreScreen(), 
    const MoreScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.local_offer), label: 'Deals'),
    const BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Stores'),
    const BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
  ];

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarItems,
        currentIndex: _selectedIndex,
        onTap: _onBottomNavItemTapped,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
