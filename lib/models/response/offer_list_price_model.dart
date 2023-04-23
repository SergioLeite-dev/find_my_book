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

  Map<String, dynamic> toJson() => {
        "amountInMicros": amountInMicros,
        "currencyCode": currencyCode,
      };
}
