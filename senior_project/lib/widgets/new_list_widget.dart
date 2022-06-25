import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news.dart';

// import 'package:url_launcher/url_launcher.dart';
class NewsListWidget extends StatelessWidget {
  final List<News> newsList;

  NewsListWidget(this.newsList);

  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: newsList[index].image,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print('tab');
                      _launchUrl(Uri.parse(newsList[index].link.toString()));
                    },
                    child: Container(
                      
                      width: MediaQuery.of(context).size.width/1.8,
                      // decoration: BoxDecoration(backgroundBlendMode: ),
                      child: Text(
                        newsList[index].title.toString(),
                      
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: newsList.length,
    );
  }
}