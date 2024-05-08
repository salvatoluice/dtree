import 'package:flutter/material.dart';
import 'package:dtree/main.dart';
import 'package:dtree/screens/home_content.dart'; // Import the HomeContent widget

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens for each bottom nav item
  List<Widget> _screens = [
    HomeContent(), // Use HomeContent widget for Home screen
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
      body: _screens[_selectedIndex], // Use selected screen based on index
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
