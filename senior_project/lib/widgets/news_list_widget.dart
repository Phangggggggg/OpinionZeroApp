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
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                // Container(
                //   margin: EdgeInsets.symmetric(
                //     vertical: 10,
                //     horizontal: 15,
                //   ),
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //       color: Colors.purple,
                //       width: 2,
                //     ),
                //   ),
                //   padding: EdgeInsets.all(10),
                //   child: newsList[index].image,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print('tab');
                         _launchUrl(Uri.parse(newsList[index].link.toString()));
                      },
                      child: Column(
                        children: [
                          Text(
                            newsList[index].title.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            newsList[index].xclass.toString(),
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: newsList.length,
      ),
    );
  }
}
