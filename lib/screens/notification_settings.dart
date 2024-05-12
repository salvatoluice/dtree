import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _notificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: _notificationEnabled,
            onChanged: (value) {
              setState(() {
                _notificationEnabled = value;
              });
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Push Notifications'),
            subtitle: const Text('Receive push notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Handle push notifications toggle
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Email Notifications'),
            subtitle: const Text('Receive email notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Handle email notifications toggle
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('SMS Notifications'),
            subtitle: const Text('Receive SMS notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Handle SMS notifications toggle
              },
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
