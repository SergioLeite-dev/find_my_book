class ImageLinks {
  ImageLinks._({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  final String smallThumbnail;
  final String thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks._(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );
}
