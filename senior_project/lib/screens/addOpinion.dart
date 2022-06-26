import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/models/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    n.fetchOpinionNews().then((lst) => listNews = lst);
    return Column(
      children: [
        Container(
          child: Text(
            'Add Your Opinion',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          child: ListOpinionNewsWidget(listNews),
        ),
      ],
    );
  }
}
