import 'package:find_my_book/models/response/offer_list_price_model.dart';

class Offer {
  Offer._({
    required this.finskyOfferType,
    required this.listPrice,
    required this.retailPrice,
    required this.giftable,
  });

  final int finskyOfferType;
  final OfferListPrice listPrice;
  final OfferListPrice retailPrice;
  final bool giftable;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer._(
        finskyOfferType: json["finskyOfferType"],
        listPrice: OfferListPrice.fromJson(json["listPrice"]),
        retailPrice: OfferListPrice.fromJson(json["retailPrice"]),
        giftable: json["giftable"],
      );

  static Map<String, dynamic> toJson(Offer value) => {
        "finskyOfferType": value.finskyOfferType,
        "listPrice": OfferListPrice.toJson(value.listPrice),
        "retailPrice": OfferListPrice.toJson(value.retailPrice),
        "giftable": value.giftable,
      };
}
