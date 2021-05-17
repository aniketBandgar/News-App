import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news-data-model.dart';

class NewsDataList with ChangeNotifier {
  List<NewsData> _items = [];

  List<NewsData> get newsItems {
    return [..._items];
  }

  Future<void> fetchDataFromServer() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=ec20db2447924cdda06848ada8178891');
    final response = await http.get(url);
    final responseData = jsonDecode(response.body) as Map<String, dynamic>;
    final mainData = responseData['articles'];
    final List<NewsData> loadedData = [];
    mainData.forEach((e) {
      if (e['urlToImage'] != null && e['description'] != null) {
        loadedData.add(NewsData(
          author: e['author'],
          title: e['title'],
          description: e['description'],
          imageUrl: e['urlToImage'],
          url: e['url'],
        ));
      }
    });
    _items = loadedData;
    notifyListeners();
  }
}
