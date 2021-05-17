import 'package:flutter/material.dart';
import 'package:news_app/providers/category-news-list.dart';
import 'package:news_app/providers/news-data-list.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => NewsDataList(),
      child: ChangeNotifierProvider(
        create: (ctx) => CategoryNewsData(),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white,
            canvasColor: Colors.white,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
