import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'login_page.dart';
import 'menu_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color myColor = Color.fromRGBO(255, 169, 0, 1.0);

    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        primaryColor: myColor,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: myColor,
          brightness: Brightness.light,
          secondary: myColor,
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: myColor,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: myColor,
          primary: myColor,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    );
  }
}
