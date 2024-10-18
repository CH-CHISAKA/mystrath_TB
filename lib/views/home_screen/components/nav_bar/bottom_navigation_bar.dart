import 'package:flutter/material.dart';
import 'package:mystrath/views/notification_screen/notification_screen.dart';
import 'package:mystrath/views/search_screen/search_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  // ignore: unused_field
  final List<Widget> _screens = [
    const Center(child: Text('Home Screen')),
    const SearchScreen(),
    const NotificationScreen(),
    const Center(child: Text('Profile Screen')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      // backgroundColor: Colors.black12,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[300],
      
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          // backgroundColor: Color(0xFF1d2637)
          backgroundColor: Color(0xFF17203A)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor: Color(0xFF17203A)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
          backgroundColor: Color(0xFF17203A)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Color(0xFF17203A)
        ),
      ],
    );
  }
}
