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

  Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
      };
}
