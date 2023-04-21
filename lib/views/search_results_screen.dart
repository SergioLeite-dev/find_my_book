import 'package:find_my_book/controllers/search_controller.dart';
import 'package:find_my_book/widgets/return_button.dart';
import 'package:find_my_book/widgets/search_button.dart';
import 'package:find_my_book/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});
  static const routeName = "/search-results";

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late final SearchController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<SearchController>();
    controller.addListener(_resultsListener);
  }

  _resultsListener() {
    if (mounted && ModalRoute.of(context)!.isCurrent) {
      switch (controller.state) {
        case SearchState.success:
          //TODO: Unnecessary navigation. Just update List Widget.
          Navigator.of(context).pushReplacementNamed(SearchResultsScreen.routeName);
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
    controller.removeListener(_resultsListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const ReturnButton(height: 40),
                const SizedBox(width: 20),
                SearchTextField.withInitialText(
                  initialText: controller.searchRequest.querry,
                  height: 40,
                  radius: 25,
                ),
                const SearchButton(
                  iconData: Icons.search,
                  height: 40,
                  radius: 25,
                ),
              ],
            ),
            ItemsListView(),
          ],
        ),
      ),
    );
  }
}

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //TODO: Implement ListView
    return Flexible(
      fit: FlexFit.loose,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(title: Text("item $index"));
        },
      ),
    );
  }
}
