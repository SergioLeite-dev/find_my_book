class PanelizationSummary {
  PanelizationSummary._({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  final bool containsEpubBubbles;
  final bool containsImageBubbles;

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary._(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  static Map<String, dynamic> toJson(PanelizationSummary value) => {
        "containsEpubBubbles": value.containsEpubBubbles,
        "containsImageBubbles": value.containsImageBubbles,
      };
}
