import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/models/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/providers/listnews_provider.dart';
import '../colors/colors.dart';
import '../widgets/list_opinion_news_widget.dart';
import 'package:get/get.dart';
import '/screens/votedHistory.dart';

class AddOpinion extends StatefulWidget {
  const AddOpinion({Key? key}) : super(key: key);

  @override
  State<AddOpinion> createState() => _AddOpinionState();
}

class _AddOpinionState extends State<AddOpinion> {
  late List<News> listNews = [];

  @override
  Widget build(BuildContext context) {
    News n = News(id: "xx", title: "rr");

    return Consumer<ListNewsProvider>(
        builder: (context, listNewsProvider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 0, 1),
                    child: Text(
                      'Add Opinion',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: kBlackBrown),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 0, 1),
                child: MaterialButton(
                  minWidth: 50.0,
                  height: 30.0,
                  color: kDarkBlue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  onPressed: () {
                    Get.toNamed('/votedHistory');
                  },
                  child: Text(
                    'Vote history',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 4,
                  color: kDarkBlue,
                ),
                Container(
                  width: 110,
                  height: 5,
                  color: kLightBlue,
                ),
              ],
            ),
          ),
          ListOpinionNewsWidget(listNewsProvider.opinionListNews),
        ],
      );
    });
  }
}
