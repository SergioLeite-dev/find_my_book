class SearchInfo {
  SearchInfo._({
    required this.textSnippet,
  });

  final String textSnippet;

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo._(
        textSnippet: json["textSnippet"],
      );

  static Map<String, dynamic> toJson(SearchInfo value) => {
        "textSnippet": value.textSnippet,
      };
}
