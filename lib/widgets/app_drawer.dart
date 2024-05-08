import 'package:flutter/material.dart';
import 'package:dtree/main.dart';

class AppDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppDrawer({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 80,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('Register'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/register');
            },
          ),
          ListTile(
            title: Text('Login'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
