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

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
      };
}
