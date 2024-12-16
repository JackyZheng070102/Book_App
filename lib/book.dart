class Book {
  final String id;
  final String title;
  final String author;
  final String summary;
  final String imageUrl;
  final double rating;
  final List<String> genres;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.summary,
    required this.imageUrl,
    required this.rating,
    required this.genres,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      summary: json['summary'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      genres: List<String>.from(json['genres'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'summary': summary,
      'imageUrl': imageUrl,
      'rating': rating,
      'genres': genres,
    };
  }
}
