class Suggestion {
  final String title;
  final String description;

  Suggestion({
    required this.title,
    required this.description,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      title: json['title'],
      description: json['description'],
    );
  }
}