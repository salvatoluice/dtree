import 'package:flutter/material.dart';

class SecuritySettingsPage extends StatefulWidget {
  const SecuritySettingsPage({Key? key}) : super(key: key);

  @override
  _SecuritySettingsPageState createState() => _SecuritySettingsPageState();
}

class _SecuritySettingsPageState extends State<SecuritySettingsPage> {
  bool _enableTwoFactorAuth = false;
  bool _enableBiometricAuth = false;
  bool _useStrongPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          SwitchListTile(
            title: const Text('Enable Two-Factor Authentication'),
            value: _enableTwoFactorAuth,
            onChanged: (value) {
              setState(() {
                _enableTwoFactorAuth = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Enable Biometric Authentication'),
            value: _enableBiometricAuth,
            onChanged: (value) {
              setState(() {
                _enableBiometricAuth = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Use Strong Password'),
            value: _useStrongPassword,
            onChanged: (value) {
              setState(() {
                _useStrongPassword = value;
              });
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
