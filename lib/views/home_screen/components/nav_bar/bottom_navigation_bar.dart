import 'package:flutter/material.dart';
import 'package:mystrath/views/home_screen/main_home_screen.dart';

class BottomNavigation extends StatefulWidget {
  final MainHomeScreenState parentState;
  const BottomNavigation({super.key, required this.parentState});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentScreen = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentScreen = index;
      widget.parentState.setState(() {
        widget.parentState.selectedIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      // backgroundColor: Colors.black12,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[300],

      currentIndex: _currentScreen,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Color(0xFF1d2637)
            backgroundColor: Color(0xFF17203A)),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Color(0xFF17203A)),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Color(0xFF17203A)),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color(0xFF17203A)),
      ],
    );
  }
}
