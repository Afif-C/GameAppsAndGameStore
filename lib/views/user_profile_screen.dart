import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String nickname = 'Fal';
  String title = 'Jobless';

  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nicknameController.text = nickname;
    titleController.text = title;
  }

  @override
  void dispose() {
    nicknameController.dispose();
    titleController.dispose();
    super.dispose();
  }

  void _editPersonalInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Personal Info"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nickname'),
                controller: nicknameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  nickname = nicknameController.text;
                  title = titleController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 0,
        title: Text("My Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[800]!, Colors.black],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with your profile image
              ),
              SizedBox(height: 10),
              Text(nickname, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              Text(title, style: TextStyle(fontSize: 16, color: Colors.white70)),
              SizedBox(height: 20),
              Divider(color: Colors.white24),
              ListTile(
                title: Text("Personal Info", style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () => _editPersonalInfo(context),
              ),
              ListTile(
                title: Text("Game Progress", style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () => Navigator.pushNamed(context, '/gameProgress'),
              ),
              ListTile(
                title: Text("Billing Method", style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () => Navigator.pushNamed(context, '/billingMethod'),
              ),
              ListTile(
                title: Text("Settings", style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
              ListTile(
                title: Text("Logout", style: TextStyle(color: Colors.redAccent)),
                trailing: Icon(Icons.logout, color: Colors.redAccent),
                onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
