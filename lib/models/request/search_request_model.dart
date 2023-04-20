import 'package:find_my_book/static/static_values.dart';

class SearchRequestModel {
  final String apiKey = StaticValues.apiKey;
  final String querry;

  SearchRequestModel(this.querry);

  SearchRequestModel copyWith({String? querry}) {
    return SearchRequestModel(querry ?? this.querry);
  }

  Map<String, dynamic> toMap() {
    return {
      "API_KEY": apiKey,
      "q": querry,
    };
  }
}
