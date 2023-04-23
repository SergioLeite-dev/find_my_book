import 'package:find_my_book/controllers/search_controller.dart';
import 'package:find_my_book/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/items_controller_interface.dart';

enum ListType { search, favorites }

class ItemsListView extends StatelessWidget {
  const ItemsListView.search({
    super.key,
  }) : type = ListType.search;

  final ListType type;

  @override
  Widget build(BuildContext context) {
    //TODO: favorite case
    final ItemsControllerInterface controller = type == ListType.search ? context.watch<SearchController>() : context.watch<SearchController>();
    return Expanded(
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        itemCount: controller.itemsList.length,
        itemBuilder: (context, index) => ItemCard(controller.itemsList[index]),
      ),
    );
  }
}
