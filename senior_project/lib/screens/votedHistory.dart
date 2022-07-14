import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/models/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/providers/listnews_provider.dart';
import 'package:senior_project/utils/user_shared_preference.dart';
import 'package:get/get.dart';
import '../widgets/new_list_widget.dart';

class VotedHistory extends StatefulWidget {
  const VotedHistory({Key? key}) : super(key: key);

  @override
  State<VotedHistory> createState() => _VotedHistoryState();
}

class _VotedHistoryState extends State<VotedHistory> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListNewsProvider>(
        builder: (context, listNewsProvider, child) {
      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 65, 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Text(
                    'Voted History  ',
                    style: TextStyle(fontSize: 30),
                  ),
                  // SizedBox(
                  //   width: 2,
                  // )
                ],
              ),
            ),
            Expanded(
                child: NewsListWidget(listNewsProvider.votedHistoryList, 2)),
          ],
        ),
      );
    });
  }
}
