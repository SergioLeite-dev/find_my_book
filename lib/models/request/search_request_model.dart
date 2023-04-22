import 'package:find_my_book/static/static_values.dart';

class SearchRequestModel {
  SearchRequestModel({
    required this.querry,
    required this.startIndex,
  });

  SearchRequestModel copyWith({
    String? querry,
    int? startIndex,
  }) {
    return SearchRequestModel(
      querry: querry ?? this.querry,
      startIndex: startIndex ?? this.startIndex,
    );
  }

  final String apiKey = StaticValues.apiKey;
  final String orderBy = StaticValues.orderBy;
  final int maxResults = StaticValues.maxResults;
  final int startIndex;
  final String querry;

  Map<String, dynamic> toMap() {
    return {
      "API_KEY": apiKey,
      "orderBy": orderBy,
      "maxResults": maxResults,
      "startIndex": startIndex,
      "q": querry,
    };
  }
}
