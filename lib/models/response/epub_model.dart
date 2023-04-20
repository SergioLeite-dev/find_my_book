class Epub {
  Epub._({
    required this.isAvailable,
    this.acsTokenLink,
  });

  final bool isAvailable;
  final String? acsTokenLink;

  factory Epub.fromJson(Map<String, dynamic> json) => Epub._(
        isAvailable: json["isAvailable"],
        acsTokenLink: json["acsTokenLink"],
      );
}
