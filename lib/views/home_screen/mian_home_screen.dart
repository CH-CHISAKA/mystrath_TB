import 'package:flutter/material.dart';
import 'package:mystrath/views/home_screen/components/banner_widget_carousel/banner_widget_carousel.dart';
import 'package:mystrath/views/themes/theme_toggle.dart';
import 'package:provider/provider.dart';
import 'package:mystrath/views/home_screen/components/hamburger_menu/hamburgermenu.dart';
import 'package:mystrath/views/notification_screen/notification_screen.dart';
import 'package:mystrath/views/search_screen/search_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Center(child: Text('Home Screen')),
    const SearchScreen(),
    const NotificationScreen(),
    const Center(child: Text('Profile Screen')),
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final themeToggle = Provider.of<ThemeToggle>(context);
    final backgroundColor = themeToggle.isDarkMode
        ? const Color(0xFF1A1A24)
        : const Color(0xFFE3E3E3);

    return Scaffold(
      key: scaffoldKey,
      appBar: _buildAppBar(),
      drawer: const Drawer(
        child: HamburgerMenu(),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const BannerWidgetCarousel(),
          Expanded(child: _screens[_selectedIndex]), // Dynamically switch the screens
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('MyStrath App'),
      leading: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.5),
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.white24,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[300],
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Color(0xFF17203A),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor: Color(0xFF17203A),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
          backgroundColor: Color(0xFF17203A),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Color(0xFF17203A),
        ),
      ],
    );
  }
}
