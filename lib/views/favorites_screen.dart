import 'package:find_my_book/views/items_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static const routeName = "/favorites";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Favorites")),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: ItemsListView.favorites(),
      ),
    );
  }
}
