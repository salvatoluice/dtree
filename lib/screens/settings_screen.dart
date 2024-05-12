import 'package:dtree/screens/about_us.dart';
import 'package:dtree/screens/account_settings.dart';
import 'package:dtree/screens/notification_settings.dart';
import 'package:dtree/screens/privacy_settings.dart';
import 'package:dtree/screens/security_settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          ListTile(
            title: const Text('Account Settings'),
            leading: const Icon(Icons.account_circle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AccountSettingsPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Notification Settings'),
            leading: const Icon(Icons.notifications),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationSettingsPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Privacy Settings'),
            leading: const Icon(Icons.privacy_tip),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PrivacySettingsPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Security Settings'),
            leading: const Icon(Icons.security),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecuritySettingsPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Billing Settings'),
            leading: const Icon(Icons.payment),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => BillingSettingsScreen()),
              // );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('About Us'),
            leading: const Icon(Icons.info),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              // Perform logout action
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
