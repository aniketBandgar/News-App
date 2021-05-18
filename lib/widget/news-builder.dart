import 'package:flutter/material.dart';
import 'package:news_app/screens/articles-screen.dart';

class NewsBuilder extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  final String author;

  NewsBuilder({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.url,
    @required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ArticlePage(url: url),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 5,
          color: Colors.black,
        )
      ],
    );
  }
}
