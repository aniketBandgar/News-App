import 'package:flutter/foundation.dart';

class NewsData {
  String author;
  String title;
  String description;
  String imageUrl;
  String url;

  NewsData({
    @required this.author,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.url,
  });
}
