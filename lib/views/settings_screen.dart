import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isPushNotificationEnabled = false;

  void _togglePushNotification() {
    setState(() {
      isPushNotificationEnabled = !isPushNotificationEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[800]!, Colors.black],
          ),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text("Push Notifications", style: TextStyle(color: Colors.white)),
              trailing: Switch(
                value: isPushNotificationEnabled,
                onChanged: (value) {
                  _togglePushNotification();
                },
                activeColor: Colors.blueAccent,
                inactiveThumbColor: Colors.grey,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "App Version: 9.11",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
