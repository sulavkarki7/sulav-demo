class Combo {
  final String comboTitle;
  final String comboImage;
  final int comboPrice;

  Combo({
    required this.comboTitle,
    required this.comboImage,
    required this.comboPrice,
  });

  factory Combo.fromJson(Map<String, dynamic> json) {
    return Combo(
      comboTitle: json['comboTitle'] ?? 'Default Title',
      comboImage: json['comboImage'] ?? '',
      comboPrice: (json['comboPrice'] != null) ? json['comboPrice'] : 0,
    );
  }
}
