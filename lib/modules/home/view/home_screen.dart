import 'package:find_my_book/modules/shared/controllers/search_controller.dart';
import 'package:find_my_book/modules/results/view/search_results_screen.dart';
import 'package:find_my_book/modules/home/view/widgets/go_to_favorites_button.dart';
import 'package:find_my_book/modules/shared/widgets/search_text_field.dart';
import 'package:find_my_book/modules/shared/widgets/search_button.dart';
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
    controller.addListener(_homeListener);
  }

  _homeListener() {
    if (mounted && ModalRoute.of(context)!.isCurrent) {
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
    }
  }

  @override
  void dispose() {
    controller.removeListener(_homeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, -0.38),
                child: Image.asset("assets/images/logo.png"),
              ),
              Align(
                alignment: Alignment(0, 0.12),
                child: Row(
                  children: const [
                    SearchTextField(
                      height: 50,
                      radius: 30,
                    ),
                    SearchButton(
                      height: 50,
                      radius: 30,
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: GoToFavoritesButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
