class IndustryIdentifier {
  IndustryIdentifier._({
    required this.type,
    required this.identifier,
  });

  final String type;
  final String identifier;

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier._(
        type: json["type"],
        identifier: json["identifier"],
      );

  static Map<String, dynamic> toJson(IndustryIdentifier value) => {
        "type": value.type,
        "identifier": value.identifier,
      };
}
