import 'package:find_my_book/models/response/item_model.dart';
import 'package:flutter/material.dart';

abstract class ItemsControllerInterface extends ChangeNotifier {
  List<Item> get itemsList;
}
