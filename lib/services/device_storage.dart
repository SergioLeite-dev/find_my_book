import 'dart:convert';
import 'dart:developer';

import 'package:find_my_book/models/response/item_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeviceStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyFavorites = "favorites";

  static Future setFavorites(List<Item> favorites) async {
    final encoded = _encodeList(favorites);
    await _storage.write(key: _keyFavorites, value: encoded);
    //The code below shows that DeviceStorage is working as intended
    final result = await getFavorites();
    log(_encodeList(result ?? []));
  }

  static Future<List<Item>?> getFavorites() async {
    try {
      final String? encoded = await _storage.read(key: _keyFavorites);
      return encoded != null ? _decodeList(encoded) : null;
    } catch (e) {
      rethrow;
    }
  }

  static String _encodeList(List<Item> favorites) {
    return jsonEncode(favorites, toEncodable: (value) => value is Item ? Item.toJson(value) : throw UnsupportedError('Cannot convert to JSON: $value'));
  }

  static List<Item> _decodeList(String encoded) {
    try {
      final List<dynamic> json = jsonDecode(encoded);
      return List<Item>.from(json.map((x) => Item.fromJson(x)));
    } catch (e) {
      throw UnsupportedError('Cannot convert from JSON.\n${e.toString()}');
    }
  }
}
