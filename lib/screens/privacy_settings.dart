import 'package:flutter/material.dart';

class PrivacySettingsPage extends StatefulWidget {
  const PrivacySettingsPage({Key? key}) : super(key: key);

  @override
  _PrivacySettingsPageState createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  bool _allowLocationSharing = true;
  bool _allowDataCollection = true;
  bool _allowPersonalizedAds = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          SwitchListTile(
            title: const Text('Allow Location Sharing'),
            value: _allowLocationSharing,
            onChanged: (value) {
              setState(() {
                _allowLocationSharing = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Allow Data Collection'),
            value: _allowDataCollection,
            onChanged: (value) {
              setState(() {
                _allowDataCollection = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Allow Personalized Ads'),
            value: _allowPersonalizedAds,
            onChanged: (value) {
              setState(() {
                _allowPersonalizedAds = value;
              });
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
