import 'package:find_my_book/controllers/search_controller.dart';
import 'package:find_my_book/widgets/pagination_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsListView extends StatelessWidget {
  const ResultsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SearchController>();

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              itemCount: controller.resultsLength,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${index + 1}: ${controller.searchResults?.items[index].volumeInfo.title}"),
                );
              },
            ),
          ),
          const Divider(thickness: 2, height: 0),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 20),
            child: Row(
              children: [
                Text("Page ${controller.currentPage}"),
                const Spacer(),
                const PaginationButton.previous(),
                const SizedBox(width: 10),
                const PaginationButton.next(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
