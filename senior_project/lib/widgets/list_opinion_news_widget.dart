import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/models/news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'add_opinion_widget.dart';
import '/colors/colors.dart';
import 'package:google_fonts/google_fonts.dart'; 

class ListOpinionNewsWidget extends StatelessWidget {
  final List<News> newsList;
  ListOpinionNewsWidget(this.newsList);

  static const String rootImgPath = "lib/assets/images/";

  String formatDate(String date) {
    String now;
    try {
      DateTime d = DateTime.parse(date);
      now = DateFormat.yMMMd().format(d);
    } catch (e) {
      now = "";
    }

    return now;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scrollbar(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                        print(newsList[index].id);
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddOpinionWidget(newsItem: newsList[index])));
                      },
              child: Card(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image(
                          image: AssetImage(rootImgPath +
                              newsList[index].imgPath.toString() +
                              '.png'),
                          width: 100,
                          height: 100),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              width: 200,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child:
                                          Text(
                                            newsList[index].title.toString(),
                                            style: GoogleFonts.mitr(textStyle: TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.w500, overflow: TextOverflow.clip, color:  kBlackBrown
                                          )
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        formatDate(
                                            newsList[index].date.toString()),
                                        style: TextStyle(
                                          fontSize: 14,
                                          overflow: TextOverflow.clip,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]) // column
                              ), //Container
                        ),
                      ],
                    ),
                  ]
                )
              ),
            );
          },
          itemCount: newsList.length,
        ),
      ),
    );
  }
}
