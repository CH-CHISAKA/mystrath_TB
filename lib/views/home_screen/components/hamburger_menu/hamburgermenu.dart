// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mystrath/views/home_screen/mian_home_screen.dart';
import 'package:mystrath/views/themes/themes.dart';
import 'package:mystrath/views/themes/theme_toggle.dart';
import 'package:provider/provider.dart';

class HamburgerMenu extends StatefulWidget {
  final MainHomeScreenState parentState;
  const HamburgerMenu({required this.parentState, super.key});

  @override
  _HamburgerMenuState createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  String _selectedItem = "";

  @override
  void initState() {
    super.initState();
    _selectedItem = _getMenuItemFromIndex(widget.parentState.selectedIndex);
  }

  String _getMenuItemFromIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Notifications';
      case 4:
        return 'History';
      case 5:
        return 'Help';
      case 6:
        return 'About';
      case 7:
        return 'Log Out';
      default:
        return '';
    }
  }

  void _onMenuItemTap(String title, int index) {
    setState(() {
      _selectedItem = title;
      // Switch to appropriate page
      widget.parentState.setState(() {
        widget.parentState.selectedIndex = index;
      });
      // Close the hamburger menu
      Navigator.of(context).pop();
    });
  }

  Widget _buildAnimatedListTile(
    String title,
    IconData icon,
    VoidCallback onTap,
    Color textColor,
    Color iconColor,
  ) {
    bool isSelected = _selectedItem == title;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blueAccent.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Row(
          children: [
            Container(
              width: 5,
              height: 50,
              color: isSelected ? Colors.blueAccent : Colors.transparent,
            ),
            const SizedBox(width: 15),
            Icon(
              icon,
              color: isSelected ? Colors.blueAccent : iconColor,
              size: isSelected ? 28 : 23, // Minor change
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.blueAccent : textColor,
                fontSize: isSelected ? 18.5 : 16,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeToggle = Provider.of<ThemeToggle>(context);
    final theme = themeToggle.isDarkMode ? darkTheme : lightTheme;
    final textColor = theme.textTheme.bodyLarge!.color!;
    final iconColor = theme.iconTheme.color!;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        color: themeToggle.isDarkMode ? const Color(0xFF17203A) : Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
                ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 0.1),
                  child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 105, 105, 105),
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                  ),
                ),
                title: Text(
                  'The Boys', // Minor change
                  style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "the.boys@strathmore.edu",
                  style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 13,
                  ),
                ),
                onTap: () => _onMenuItemTap('The Boys', 3),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  color: textColor.withOpacity(0.3),
                  thickness: 0.5,
                  height: 40,
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildAnimatedListTile(
                          'Home',
                          Icons.home,
                          () => _onMenuItemTap('Home', 0),
                          textColor,
                          iconColor,
                        ),
                        _buildAnimatedListTile(
                          'Search',
                          Icons.search,
                          () => _onMenuItemTap('Search', 1),
                          textColor,
                          iconColor,
                        ),
                        _buildAnimatedListTile(
                          'Notifications',
                          Icons.notifications,
                          () => _onMenuItemTap('Notifications', 2),
                          textColor,
                          iconColor,
                        ),
                        _buildAnimatedListTile(
                          'History',
                          Icons.history,
                          () => _onMenuItemTap('History', 4),
                          textColor,
                          iconColor,
                        ),
                        _buildAnimatedListTile(
                          'Help',
                          Icons.help,
                          () => _onMenuItemTap('Help', 5),
                          textColor,
                          iconColor,
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.brightness_6),
                          title: const Text('Toggle Theme'),
                          onTap: () {
                            themeToggle.toggleTheme();
                          },
                        ),
                        _buildAnimatedListTile(
                          'About',
                          Icons.info,
                          () => _onMenuItemTap('About', 6),
                          textColor,
                          iconColor,
                        ),
                        _buildAnimatedListTile(
                          'Log Out',
                          Icons.logout,
                          () => _onMenuItemTap('Log Out', 0),
                          textColor,
                          iconColor,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
