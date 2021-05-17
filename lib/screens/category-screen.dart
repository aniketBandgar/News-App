import 'package:flutter/material.dart';
import 'package:news_app/providers/category-news-list.dart';
import 'package:provider/provider.dart';
import '../widget/news-builder.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String categoryName;
  CategoryNewsScreen({@required this.categoryName});

  @override
  _CategoryNewsScreenState createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryNewsData>(context, listen: false)
        .fetchDataFromServer(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<CategoryNewsData>(builder: (ctx, newsData, _) {
        return ListView.builder(
          itemBuilder: (ctx, i) {
            return NewsBuilder(
              title: newsData.newsItems[i].title,
              description: newsData.newsItems[i].description,
              imageUrl: newsData.newsItems[i].imageUrl,
              url: newsData.newsItems[i].url,
              author: newsData.newsItems[i].author,
            );
          },
          itemCount: newsData.newsItems.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
        );
      }),
    );
  }
}
