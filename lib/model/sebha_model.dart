class Tasbeeh {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String content;

  Tasbeeh({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory Tasbeeh.fromJson(Map<String, dynamic> json) {
    return Tasbeeh(
      category: json['category'],
      count: json['count'],
      description: json['description'],
      reference: json['reference'],
      content: json['content'],
    );
  }
}