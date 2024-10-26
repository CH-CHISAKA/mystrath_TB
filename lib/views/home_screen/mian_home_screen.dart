import 'package:flutter/material.dart';
import 'package:mystrath/views/attendance_screen/attendance_screen.dart';
import 'package:mystrath/views/home_screen/components/nav_bar/bottom_navigation_bar.dart';
import 'package:mystrath/views/themes/theme_toggle.dart';
import 'package:provider/provider.dart';
import 'package:mystrath/views/home_screen/components/hamburger_menu/hamburgermenu.dart';
import 'package:mystrath/views/notification_screen/notification_screen.dart';
import 'package:mystrath/views/search_screen/search_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => MainHomeScreenState();
}

class MainHomeScreenState extends State<MainHomeScreen> {
  int selectedIndex = 0;

  final List<Widget> _screens = [
    const Center(child: Text('Home Screen')),
    const SearchScreen(),
    const NotificationScreen(),
    const Center(child: Text('Profile Screen')),
    const Center(child: Text('History Screen')),
    const Center(child: Text('Help Screen')),
    const Center(child: Text('About Screen')),
    AttendanceScreen(),
  ];

  late BottomNavigation bottomNavigation;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    bottomNavigation = BottomNavigation(parentState: this);
  }

  @override
  Widget build(BuildContext context) {
    final themeToggle = Provider.of<ThemeToggle>(context);
    final backgroundColor = themeToggle.isDarkMode
        ? const Color(0xFF1A1A24)
        : const Color(0xFFE3E3E3);

    return Scaffold(
      key: scaffoldKey,
      appBar: _buildAppBar(),
      drawer: Drawer(
        child: HamburgerMenu(
          parentState: this,
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          //const BannerWidgetCarousel(),
          Expanded(
            child: _screens[selectedIndex],
          ) // Dynamically switch the screens
        ],
      ),
      bottomNavigationBar: bottomNavigation,
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
}
