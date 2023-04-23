import 'package:find_my_book/controllers/items_controller_interface.dart';
import 'package:find_my_book/models/request/search_request_model.dart';
import 'package:find_my_book/models/response/item_model.dart';
import 'package:find_my_book/models/response/volume_list_model.dart';
import 'package:find_my_book/services/http_client.dart';
import 'package:find_my_book/static/static_values.dart';
import 'package:flutter/material.dart';

enum SearchState { idle, loading, success, error, badRequest }

class SearchController extends ChangeNotifier implements ItemsControllerInterface {
  SearchController(this.client);

  @override
  List<Item> itemsList = [];

  final ClientHttp client;
  var state = SearchState.idle;
  var searchRequest = SearchRequestModel(querry: "", startIndex: 0);
  int currentPage = 1;
  int maxPages = 1;
  VolumeList? searchResult;

  Future<void> search() async {
    //state = SearchState.loading;
    //notifyListeners();
    //await Future.delayed(const Duration(seconds: 1));
    if (searchRequest.querry == "") {
      state = SearchState.badRequest;
      notifyListeners();
      state = SearchState.idle;
      return;
    }
    searchRequest = searchRequest.copyWith(startIndex: (StaticValues.maxResults * (currentPage - 1)));
    try {
      final response = await client.get(StaticValues.apiUrl, searchRequest.toMap());
      searchResult = VolumeList.fromJson(response);
      itemsList = searchResult?.items ?? [];
      maxPages = (searchResult!.totalItems / StaticValues.maxResults).ceil();
      //print("total items property ${searchResults?.totalItems}");
      //print("items shown $resultsLength");
      state = SearchState.success;
      notifyListeners();
      state = SearchState.idle;
    } catch (e) {
      print(e);
      state = SearchState.error;
      notifyListeners();
      state = SearchState.idle;
    }
  }

  void goToPreviousPage() {
    if (currentPage > 1) {
      currentPage--;
      search();
    } else {
      //TODO: Implement no previous page error;
    }
  }

  void goToNextPage() {
    if (currentPage < maxPages) {
      currentPage++;
      search();
    } else {
      //TODO: Implement no next page error;
    }
  }
}
