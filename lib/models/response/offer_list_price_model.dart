class OfferListPrice {
  OfferListPrice._({
    required this.amountInMicros,
    required this.currencyCode,
  });

  final int amountInMicros;
  final String currencyCode;

  factory OfferListPrice.fromJson(Map<String, dynamic> json) => OfferListPrice._(
        amountInMicros: json["amountInMicros"],
        currencyCode: json["currencyCode"],
      );

  static Map<String, dynamic> toJson(OfferListPrice value) => {
        "amountInMicros": value.amountInMicros,
        "currencyCode": value.currencyCode,
      };
}
