class SaleInfoListPrice {
  SaleInfoListPrice._({
    required this.amount,
    required this.currencyCode,
  });

  final double amount;
  final String currencyCode;

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) => SaleInfoListPrice._(
        amount: json["amount"]?.toDouble(),
        currencyCode: json["currencyCode"],
      );

  static Map<String, dynamic> toJson(SaleInfoListPrice value) => {
        "amount": value.amount,
        "currencyCode": value.currencyCode,
      };
}
