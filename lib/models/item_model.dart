import 'package:find_my_book/models/access_info_model.dart';
import 'package:find_my_book/models/sale_info_model.dart';
import 'package:find_my_book/models/search_info_model.dart';
import 'package:find_my_book/models/volume_info_model.dart';

class Item {
  Item._({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    this.searchInfo,
  });

  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;
  final SearchInfo? searchInfo;

  factory Item.fromJson(Map<String, dynamic> json) => Item._(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]),
      );
}
