import 'package:find_my_book/modules/shared/controllers/search_controller.dart';
import 'package:find_my_book/modules/shared/widgets/items_list_view.dart';
import 'package:find_my_book/modules/results/view/widgets/pagination_button.dart';
import 'package:find_my_book/modules/results/view/widgets/return_button.dart';
import 'package:find_my_book/modules/shared/widgets/search_button.dart';
import 'package:find_my_book/modules/shared/widgets/search_text_field.dart';
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
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, statusBarHeight + 20, 20, 0),
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
                    height: 40,
                    radius: 25,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Expanded(child: ItemsListView.search()),
              const Divider(thickness: 2, height: 0),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 20),
                child: Row(
                  children: [
                    Builder(builder: (context) {
                      final controller = context.watch<SearchController>();
                      return Text("Page ${controller.currentPage}");
                    }),
                    const Spacer(),
                    const PaginationButton.previous(),
                    const SizedBox(width: 10),
                    const PaginationButton.next(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
