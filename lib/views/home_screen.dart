import 'package:find_my_book/widgets/left_rounded_text_field.dart';
import 'package:find_my_book/widgets/right_rounded_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _querryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find My Book"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Center(
          child: Row(
            children: [
              LeftRoundedTextField(
                controller: _querryController,
                height: 50,
                radius: 30,
              ),
              RightRoundedButton(
                onPressed: () {},
                iconData: Icons.search,
                height: 50,
                radius: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
