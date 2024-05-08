import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'dtree',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.settings),
                        color: Colors.black,
                        onPressed: () {
                          // Handle settings icon onPressed event
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.person),
                        color: Colors.black,
                        onPressed: () {
                          // Handle profile icon onPressed event
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Welcome to dtree',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Here you can explore...',
                    style: TextStyle(fontSize: 18),
                  ),
                  // Add more content here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
