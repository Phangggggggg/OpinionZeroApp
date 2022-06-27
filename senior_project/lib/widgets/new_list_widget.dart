import 'package:flutter/material.dart';
import 'package:senior_project/colors/colors.dart';
import 'package:senior_project/widgets/icon_wiget.dart';
import 'package:senior_project/widgets/xclass_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// import 'package:url_launcher/url_launcher.dart';
class NewsListWidget extends StatelessWidget {
  final List<News> newsList;
  static const String rootImgPath = "lib/assets/images/";

  NewsListWidget(this.newsList);

  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  String showPercent(String percent) {
    double p = double.parse(percent) * 100;
    return p.toStringAsFixed(2)+" %";
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

  Widget buildIconWidget(String xclass) {
    if (xclass == '1') {
      return XclassWidget(
        icon: Icons.circle,
        size: 12,
        color: kYellow,
      );
    } else if (xclass == '2') {
      return XclassWidget(icon: Icons.circle, size: 12, color: kRed);
    } else {
      return XclassWidget(icon: Icons.circle, size: 12, color: kNeutral);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
                        print('tab');
                        _launchUrl(Uri.parse(newsList[index].link.toString()));
                      },
            child: Card(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
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
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(newsList[index].title.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.clip,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  formatDate(newsList[index].date.toString()),
                                  style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.clip,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    buildIconWidget(newsList[index].xclass.toString()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      showPercent(
                                          newsList[index].percent.toString()),
                                      style: TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.clip,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
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
          );
        },
        itemCount: newsList.length,
      ),
    );
  }
}
