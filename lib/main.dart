import 'package:flutter/material.dart';
import 'views/home_screen.dart';
import 'views/menu_screen.dart';
import 'views/skin_list_screen.dart';
import 'views/user_profile_screen.dart';
import 'views/game_progress_screen.dart';
import 'views/billing_method_screen.dart';
import 'views/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'coolvetica',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/skinList': (context) => SkinListScreen(),
        '/profile': (context) => UserProfileScreen(),
        '/gameProgress': (context) => GameProgressScreen(),
        '/billingMethod': (context) => BillingMethodScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = [
    HomeScreen(),
    MenuScreen(),
    SkinListScreen(),
    UserProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.home, 0),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.menu, 1),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.list_alt, 2),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.person, 3),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.grey[900],
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedIndex == index ? Colors.blueAccent.withOpacity(0.2) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(8),
      child: Icon(
        icon,
        color: _selectedIndex == index ? Colors.blueAccent : Colors.white60,
        size: 28,
      ),
    );
  }
}
