import 'package:flutter/material.dart';
import 'package:senior_project/colors/colors.dart';
import 'package:senior_project/widgets/icon_wiget.dart';
import 'package:senior_project/widgets/xclass_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:url_launcher/url_launcher.dart';
class NewsListWidget extends StatelessWidget {
  final List<News> newsList;
  static const String rootImgPath = "lib/assets/images/";
  final int diff;

  NewsListWidget(this.newsList, this.diff);

  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  String showPercent(String percent) {
    double p = double.parse(percent) * 100;
    return p.toStringAsFixed(2) + " %";
  }

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

  Widget buildIconWidget(String xclass, int diff) {
    if (diff == 1) {
      if (xclass == '1') {
        return XclassWidget(
            icon: Icons.circle, size: 12, color: kYellow, diff: diff);
      } else if (xclass == '2') {
        return XclassWidget(
            icon: Icons.circle, size: 12, color: kRed, diff: diff);
      } else {
        return XclassWidget(
            icon: Icons.circle, size: 12, color: kNeutral, diff: diff);
      }
    } else {
      if (xclass == '1') {
        return XclassWidget(
            icon: Icons.circle, size: 12, color: kYellow, diff: diff);
      } else if (xclass == '2') {
        return XclassWidget(
            icon: Icons.circle, size: 12, color: kRed, diff: diff);
      } else {
        return XclassWidget(
            icon: Icons.circle, size: 12, color: kNeutral, diff: diff);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              _launchUrl(Uri.parse(newsList[index].link.toString()));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: Card(
                color: kWhite1,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 14.0, 0.0, 0.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.asset(
                            height: 80,
                            width: 120,
                            fit: BoxFit.fill,
                            rootImgPath +
                                newsList[index].imgPath.toString() +
                                '.png',
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 5.0, 0.0, 8.0),
                          child: Container(
                            width: 210,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(newsList[index].title.toString(),
                                      style: GoogleFonts.mitr(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              overflow: TextOverflow.clip,
                                              color: kDarkerBlue))),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        formatDate(
                                            newsList[index].date.toString()),
                                        style: TextStyle(
                                          color: kBlackBrown,
                                          fontSize: 14,
                                          overflow: TextOverflow.clip,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          buildIconWidget(
                                              newsList[index].xclass.toString(),
                                              diff),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          newsList[index].percent != null
                                              ? Text(
                                                  showPercent(newsList[index]
                                                      .percent
                                                      .toString()),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    overflow: TextOverflow.clip,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : Text(''),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: newsList.length,
      ),
    );
  }
}
