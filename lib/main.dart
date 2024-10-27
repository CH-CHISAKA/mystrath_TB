import 'package:flutter/material.dart';
// import 'package:mystrath/views/authentications_screen/authentication_screen.dart';
import 'package:mystrath/views/home_screen/mian_home_screen.dart';
import 'package:mystrath/views/themes/theme_toggle.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeToggle(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeToggle>(
      builder: (context, themeToggle, _) {
        return MaterialApp(
          title: 'My Strathmore Application',
          theme: themeToggle.currentTheme,
          home: const MainHomeScreen(),
        );
      },
    );
  }
}
