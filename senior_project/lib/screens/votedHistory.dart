import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/models/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/providers/listnews_provider.dart';
import 'package:senior_project/utils/user_shared_preference.dart';
import '../widgets/list_opinion_news_widget.dart';

class VotedHistory extends StatefulWidget {
  const VotedHistory({Key? key}) : super(key: key);

  @override
  State<VotedHistory> createState() => _VotedHistoryState();
}

class _VotedHistoryState extends State<VotedHistory> {

  @override
  Widget build(BuildContext context) {
    News n = News(id: "xx", title: "rr");
      
    return Consumer<ListNewsProvider>(
      builder: (context,listNewsProvider, child) {
        return Column(
          children: [
            Text(
              'Add Your Opinion',
              style: TextStyle(fontSize: 30),
            ),
            ListOpinionNewsWidget(listNewsProvider.opinionListNews),
          ],
        );
      }
    );
  }
}
