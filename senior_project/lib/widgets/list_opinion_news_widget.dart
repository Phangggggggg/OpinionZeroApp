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
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddOpinionWidget(newsItem: newsList[index])));
                      },
              child: Card(
                 color: kWhite1,
                  elevation: 0,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image(
                          image: AssetImage(rootImgPath +
                              newsList[index].imgPath.toString() +
                              '.png'),
                          width: 125,
                          height: 70, 
                          fit:BoxFit.fill ),
                      )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: 200,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 8.0),
                                    child:
                                        Text(
                                          newsList[index].title.toString(),
                                          style: GoogleFonts.mitr(textStyle: TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.w500, overflow: TextOverflow.clip, color:  kDarkerBlue
                                        )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
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
