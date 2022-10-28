import 'dart:convert';

class TopHeadlineArg {
  final String country;
  final String category;
  final int page;

  TopHeadlineArg({required this.country, required this.category, this.page = 1});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'country': country});
    result.addAll({'category': category});
    result.addAll({'page': page});

    return result;
  }

  String toJson() => json.encode(toMap());
}
