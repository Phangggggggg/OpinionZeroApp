import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/models/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/providers/listnews_provider.dart';
import '../colors/colors.dart';
import '../widgets/list_opinion_news_widget.dart';

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
      builder: (context,listNewsProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,20.0,0.0,0.0),
              child: Text(
                      'Add Opinion',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kBlackBrown),
                    ),
                    
            ),
               Padding(
                   padding: const EdgeInsets.fromLTRB(12.0, 5.0, 0.0, 0.0),
                   child: Container(
                    width: 100,
                    height: 4,
                    color: kDarkBlue,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 7.0),
                   child: Container(
                    width: 110,
                    height: 5,
                    color: kLightBlue,
                   ),
                 ),
            ListOpinionNewsWidget(listNewsProvider.opinionListNews),
          ],
        );
      }
    );
  }
}
