import 'package:find_my_book/models/response/offer_model.dart';
import 'package:find_my_book/models/response/sale_info_list_price_model.dart';

class SaleInfo {
  SaleInfo._({
    required this.country,
    required this.saleability,
    required this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  final String country;
  final String saleability;
  final bool isEbook;
  final SaleInfoListPrice? listPrice;
  final SaleInfoListPrice? retailPrice;
  final String? buyLink;
  final List<Offer>? offers;

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo._(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
        listPrice: json["listPrice"] == null ? null : SaleInfoListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null ? null : SaleInfoListPrice.fromJson(json["retailPrice"]),
        buyLink: json["buyLink"],
        offers: json["offers"] == null ? null : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
      );

  static Map<String, dynamic> toJson(SaleInfo value) => {
        "country": value.country,
        "saleability": value.saleability,
        "isEbook": value.isEbook,
        "listPrice": value.listPrice == null ? null : SaleInfoListPrice.toJson(value.listPrice!),
        "retailPrice": value.retailPrice == null ? null : SaleInfoListPrice.toJson(value.retailPrice!),
        "buyLink": value.buyLink,
        "offers": value.offers == null ? null : List<Map<String, dynamic>>.from(value.offers!.map((x) => Offer.toJson(x))),
      };
}
