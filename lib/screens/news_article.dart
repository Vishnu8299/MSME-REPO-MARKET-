// lib/models/news_article.dart
class NewsArticle {
  final String title;
  final String description;
  final String content; // Add this line
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String sourceName;

  NewsArticle({
    required this.title,
    required this.description,
    required this.content, // Add this line
    required this.urlToImage,
    required this.url,
    required this.publishedAt,
    required this.sourceName,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? '',
      content: json['content'] ?? 'No Content Available', // Add this line
      urlToImage: json['urlToImage'] ??
          'https://via.placeholder.com/150', // Placeholder image
      url: json['url'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      sourceName: json['source']['name'] ?? 'Unknown Source',
    );
  }
}
