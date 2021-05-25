import 'package:flutter/material.dart';
import 'package:news_app/model/category-item-model.dart';

import 'package:news_app/providers/news-data-list.dart';
import 'package:news_app/screens/category-screen.dart';
import 'package:provider/provider.dart';
import '../model/category-data.dart';
import '../widget/news-builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> _categoryItemData;

  @override
  void initState() {
    super.initState();
    _categoryItemData = items;
    Provider.of<NewsDataList>(context, listen: false).fetchDataFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 80,
              child: ListView.builder(
                itemBuilder: (ctx, i) => CategoryItem(
                  imageUrl: _categoryItemData[i].imageUrl,
                  categoryName: _categoryItemData[i].categoryName,
                ),
                itemCount: _categoryItemData.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.blue,
            ),
            Consumer<NewsDataList>(builder: (ctx, newsData, _) {
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
            })
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  CategoryItem({
    @required this.imageUrl,
    @required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (ctx) => CategoryNewsScreen(categoryName: categoryName)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        // padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 70,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              height: 70,
              width: 120,
              child: Text(
                categoryName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
