class ZikrItem {
  final String category;
  final String count;
  final String description;
  final String content;
  final String? reference;

  ZikrItem({
    required this.category,
    required this.count,
    required this.description,
    required this.content,
    this.reference,
  });

  factory ZikrItem.fromJson(Map<String, dynamic> json) {
    return ZikrItem(
      category: json['category'] ?? '',
      count: json['count'] ?? '1',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      reference: json['reference'],
    );
  }
}