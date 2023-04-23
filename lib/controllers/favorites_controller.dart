import 'dart:convert';
import 'dart:developer';

import 'package:find_my_book/controllers/items_controller_interface.dart';
import 'package:find_my_book/models/response/item_model.dart';
import 'package:flutter/material.dart';

class FavoritesController extends ChangeNotifier implements ItemsControllerInterface {
  @override
  List<Item> itemsList = [];

  bool isItemFavorite(String id) {
    return itemsList.any((item) => item.id == id);
  }

  void toggleFavorite(Item item) {
    final existingIndex = itemsList.indexWhere((i) => i.id == item.id);
    if (existingIndex >= 0) {
      itemsList.removeAt(existingIndex);
    } else {
      itemsList.add(item);
    }
    // for (var i in itemsList) {
    //   print(i.volumeInfo.title);
    // }
    //print(jsonEncode(Item.toJson(item)));
    //log(jsonEncode(itemsList, toEncodable: (value) => value is Item ? Item.toJson(value) : throw UnsupportedError('Cannot convert to JSON: $value')));
    notifyListeners();
  }
}
