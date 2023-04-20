import 'package:find_my_book/models/request/search_request_model.dart';
import 'package:find_my_book/services/http_client.dart';
import 'package:find_my_book/static/static_values.dart';
import 'package:flutter/material.dart';

enum SearchState { idle, loading, success, error }

class SearchController extends ChangeNotifier {
  SearchController(this.client);

  final ClientHttp client;
  var state = SearchState.idle;
  var searchRequest = SearchRequestModel("");

  Future<void> search() async {
    state = SearchState.loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await client.get(StaticValues.apiUrl, searchRequest.toMap());
      print(response);
      state = SearchState.success;
      notifyListeners();
    } catch (e) {
      print(e);
      state = SearchState.error;
      notifyListeners();
    }
  }
}
