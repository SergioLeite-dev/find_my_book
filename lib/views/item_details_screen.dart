import 'package:find_my_book/models/response/item_model.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  static const routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(title: Text("${item.volumeInfo.title} ")),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Center(
          child: Text("Book Details Screen"),
        ),
      ),
    );
  }
}
