class Salad {
  final String saladTitle;
  final String saladImage;
  final int saladPrice;

  Salad({
    required this.saladTitle,
    required this.saladImage,
    required this.saladPrice,
  });

  factory Salad.fromJson(Map<String, dynamic> json) {
    return Salad(
      saladTitle: json['saladTitle'] ?? 'Default Title',
      saladImage: json['saladImage'] ?? '',
      saladPrice: (json['saladPrice'] != null) ? json['saladPrice'] : 0,
    );
  }
}
