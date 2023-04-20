import 'package:find_my_book/models/response/image_links_model.dart';
import 'package:find_my_book/models/response/industry_identifier_model.dart';
import 'package:find_my_book/models/response/panelization_summary_model.dart';
import 'package:find_my_book/models/response/reading_modes_model.dart';

class VolumeInfo {
  VolumeInfo._({
    required this.title,
    required this.authors,
    this.publisher,
    required this.publishedDate,
    this.description,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.printType,
    this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    this.subtitle,
    this.pageCount,
    this.averageRating,
    this.ratingsCount,
  });

  final String title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier> industryIdentifiers;
  final ReadingModes readingModes;
  final String printType;
  final List<String>? categories;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;
  final String? subtitle;
  final int? pageCount;
  final double? averageRating;
  final int? ratingsCount;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo._(
        title: json["title"],
        authors: json["authors"] == null ? [] : List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"],
        description: json["description"],
        industryIdentifiers: List<IndustryIdentifier>.from(json["industryIdentifiers"].map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        printType: json["printType"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null ? null : PanelizationSummary.fromJson(json["panelizationSummary"]),
        imageLinks: json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
        subtitle: json["subtitle"],
        pageCount: json["pageCount"],
        averageRating: json["averageRating"]?.toDouble(),
        ratingsCount: json["ratingsCount"],
      );
}
