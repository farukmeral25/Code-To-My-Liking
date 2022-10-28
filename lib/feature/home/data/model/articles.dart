import 'dart:convert';

class Article {
  final String? title;
  final String? description;
  final String? urlToImage;

  Article({this.title, this.description, this.urlToImage});

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'],
      description: map['description'],
      urlToImage: map['urlToImage'],
    );
  }

  factory Article.fromJson(String source) => Article.fromMap(json.decode(source));
}
