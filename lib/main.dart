import 'package:find_my_book/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FindMyBookApp());

class FindMyBookApp extends StatelessWidget {
  const FindMyBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Find My Book App",
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
