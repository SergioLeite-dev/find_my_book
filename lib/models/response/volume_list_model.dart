import 'package:find_my_book/models/response/item_model.dart';

class VolumeList {
  VolumeList._({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  final String kind;
  final int totalItems;
  final List<Item> items;

  factory VolumeList.fromJson(Map<String, dynamic> json) => VolumeList._(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

//TODO: Further test nullability of returned values fom API
//Meaning that as of now, some null value could be assigned to a required field.
//That field should have its type changed to nullable.
}
