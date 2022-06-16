import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/models/news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_opinion_widget.dart';

class ListOpinionNewsWidget extends StatelessWidget {
  final List<News> newsList;

  ListOpinionNewsWidget(this.newsList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print('added opinion');
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddOpinionWidget(newsItem: newsList[index])));
                  
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
