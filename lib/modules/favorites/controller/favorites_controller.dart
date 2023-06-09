import 'package:find_my_book/modules/shared/interfaces/items_controller_interface.dart';
import 'package:find_my_book/models/response/item_model.dart';
import 'package:find_my_book/services/device_storage.dart';
import 'package:flutter/material.dart';

class FavoritesController extends ChangeNotifier implements ItemsControllerInterface {
  FavoritesController() {
    _getFavoritesFromDeviceStorage();
  }

  @override
  List<Item> itemsList = [];

  bool isItemFavorite(String id) {
    return itemsList.any((item) => item.id == id);
  }

  void toggleFavorite(Item item) async {
    final existingIndex = itemsList.indexWhere((i) => i.id == item.id);
    if (existingIndex >= 0) {
      itemsList.removeAt(existingIndex);
    } else {
      itemsList.add(item);
    }
    await DeviceStorage.setFavorites(itemsList);
    notifyListeners();
  }

  Future<void> _getFavoritesFromDeviceStorage() async {
    itemsList = await DeviceStorage.getFavorites() ?? [];
    notifyListeners();
  }
}
