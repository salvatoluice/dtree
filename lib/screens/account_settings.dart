import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          ListTile(
            title: const Text('Edit Profile'),
            leading: const Icon(Icons.edit),
            onTap: () {
              // Navigate to edit profile page
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Change Password'),
            leading: const Icon(Icons.lock),
            onTap: () {
              // Navigate to change password page
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Manage Addresses'),
            leading: const Icon(Icons.location_on),
            onTap: () {
              // Navigate to manage addresses page
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Payment Methods'),
            leading: const Icon(Icons.payment),
            onTap: () {
              // Navigate to payment methods page
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Linked Accounts'),
            leading: const Icon(Icons.link),
            onTap: () {
              // Navigate to linked accounts page
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
