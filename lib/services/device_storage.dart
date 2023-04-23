import 'dart:convert';

import 'package:find_my_book/models/response/item_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeviceStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyFavorites = "favorites";

  static Future setFavorites(List<Item> favorites) async {
    //final encoded = jsonEncode();
  }
}
