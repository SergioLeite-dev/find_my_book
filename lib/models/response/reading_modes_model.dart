class ReadingModes {
  ReadingModes._({
    required this.text,
    required this.image,
  });

  final bool text;
  final bool image;

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes._(
        text: json["text"],
        image: json["image"],
      );

  static Map<String, dynamic> toJson(ReadingModes value) => {
        "text": value.text,
        "image": value.image,
      };
}
