import 'package:find_my_book/controllers/search_controller.dart';
import 'package:find_my_book/views/search_results_screen.dart';
import 'package:find_my_book/widgets/search_text_field.dart';
import 'package:find_my_book/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final SearchController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<SearchController>();
    controller.addListener(() {
      switch (controller.state) {
        case SearchState.success:
          Navigator.of(context).pushNamed(SearchResultsScreen.routeName);
          break;
        case SearchState.error:
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Request Error')));
          break;
        case SearchState.badRequest:
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please provide search terms')));
          break;
        default:
          break;
      }
    });
  }

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
            children: const [
              SearchTextField(
                height: 50,
                radius: 30,
              ),
              SearchButton(
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
