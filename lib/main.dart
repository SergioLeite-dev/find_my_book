import 'package:find_my_book/controllers/search_controller.dart';
import 'package:find_my_book/services/http_client.dart';
import 'package:find_my_book/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const FindMyBookApp());

class FindMyBookApp extends StatelessWidget {
  const FindMyBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ClientHttp()),
        ChangeNotifierProvider(create: (context) => SearchController(context.read())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Find My Book App",
        initialRoute: "/",
        routes: {
          "/": (context) => const HomeScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
