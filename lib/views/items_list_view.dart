import 'package:find_my_book/controllers/favorites_controller.dart';
import 'package:find_my_book/controllers/search_controller.dart';
import 'package:find_my_book/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ListType { search, favorites }

class ItemsListView extends StatelessWidget {
  const ItemsListView.search({
    super.key,
  }) : type = ListType.search;

  const ItemsListView.favorites({
    super.key,
  }) : type = ListType.favorites;

  final ListType type;

  @override
  Widget build(BuildContext context) {
    final controller = type == ListType.search ? context.watch<SearchController>() : context.watch<FavoritesController>();
    if (type == ListType.favorites && controller.itemsList.isEmpty) {
      return const Center(
        child: Text("You have no favorite books yet."),
      );
    }
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      itemCount: controller.itemsList.length,
      itemBuilder: (context, index) => ItemCard(controller.itemsList[index]),
    );
  }
}
