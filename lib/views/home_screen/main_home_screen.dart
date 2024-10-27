import 'package:flutter/material.dart';
import 'package:mystrath/models/Student.dart';
import 'package:mystrath/models/course.dart';
import 'package:mystrath/models/group.dart';
import 'package:mystrath/models/lecturer.dart';
import 'package:mystrath/models/unit.dart';
import 'package:mystrath/models/unit_class.dart';
import 'package:mystrath/views/attendance_screen/attendance_screen.dart';
import 'package:mystrath/views/home_screen/components/nav_bar/bottom_navigation_bar.dart';
import 'package:mystrath/views/home_screen/home_screen.dart';
import 'package:mystrath/views/themes/theme_toggle.dart';
import 'package:provider/provider.dart';
import 'package:mystrath/views/home_screen/components/hamburger_menu/hamburgermenu.dart';
import 'package:mystrath/views/notification_screen/notification_screen.dart';
import 'package:mystrath/views/search_screen/search_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});
  //Dummy Course

  @override
  State<MainHomeScreen> createState() => MainHomeScreenState();
}

class MainHomeScreenState extends State<MainHomeScreen> {
  int selectedIndex = 0;
  final Course course = Course(
    id: "dummy",
    name: "Bachelor of Business Information Technology",
  );

  late UnitClass dummyClass;
  late Student student;

  late List<Widget> _screens;

  late HamburgerMenu hamburgerMenu;
  late BottomNavigation bottomNavigation;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //initialize late dummy data
    student = Student(
      course: course,
      classes: [],
      email: 'theboys@strathmore.edu',
      name: 'The Boys',
      imageUrl: 'https://www.google.com/imgres?q=the%20boys&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2F6%2F68%2FThe_Boys_TV_series_logo.svg&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FThe_Boys_(TV_series)&docid=_5pxIcqNguTH0M&tbnid=Thxy4AxRSnB73M&vet=12ahUKEwiw9fTV_q2JAxV30wIHHUaoD3EQM3oECGIQAA..i&w=2500&h=975&hcb=2&ved=2ahUKEwiw9fTV_q2JAxV30wIHHUaoD3EQM3oECGIQAA',
      id: 12345,
    );
    dummyClass = UnitClass(
        unit: Unit(name: 'Coding Essentials', code: "BBT1101"),
        id: "dummy",
        group: Group(name: "BBIT 1B", id: "id", course: course),
        lecturer: Lecturer(email: 'example.com', name: 'tom', id: 0001));
    student.classes?.add(dummyClass);

    //initialize screens list to use dummy data
    _screens = [
      HomeScreen(parentState: this,),
      const SearchScreen(),
      const NotificationScreen(),
      const Center(child: Text('Profile Screen')),
      const Center(child: Text('History Screen')),
      const Center(child: Text('Help Screen')),
      const Center(child: Text('About Screen')),
      AttendanceScreen(student: student),
    ];

    //initialize hamburgerMenu and bottomNavigation
    bottomNavigation = BottomNavigation(parentState: this);
    hamburgerMenu = HamburgerMenu(parentState: this);
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
        child: hamburgerMenu
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: _screens[selectedIndex], // Dynamically switch the screens
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
