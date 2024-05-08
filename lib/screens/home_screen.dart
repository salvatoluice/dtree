import 'package:flutter/material.dart';
import 'package:dtree/main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens for each bottom nav item
  List<Widget> _screens = [
    Placeholder(), // Placeholder for Home screen
    Placeholder(), // Placeholder for Deals screen
    Placeholder(), // Placeholder for Stores screen
    Placeholder(), // Placeholder for More screen
  ];

  // List of bottom nav items
  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Deals'),
    BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Stores'),
    BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
  ];

  // Handle bottom nav item selection
  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Home'),
        backgroundColor: primaryColor,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarItems,
        currentIndex: _selectedIndex,
        onTap: _onBottomNavItemTapped,
        selectedItemColor: primaryColor, // Color of selected item
        unselectedItemColor: Colors.grey, // Color of unselected items
        showUnselectedLabels: true, // Show labels for unselected items
        type: BottomNavigationBarType.fixed, // Ensure all items are visible
      ),
    );
  }
}
