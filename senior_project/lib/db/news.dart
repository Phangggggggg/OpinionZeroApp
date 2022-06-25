import 'package:http/http.dart' as http;
import 'package:senior_project/db/apiUrl.dart';
import 'dart:convert';

import 'package:senior_project/models/news.dart';

class NewsDb {
  Future<List<List<News>>> fetchNews() async {
    List<List<News>> listNews = [[]];
    try {
      var res = await http.put(
        Uri.parse(ApiUrl.retrieveUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200) {
        var resBody = res.body;
        var responseJson = jsonDecode(utf8.decode(res.bodyBytes));
        var twmp = responseJson['test_news'].toList();
        var reds = responseJson['red_news'].toList();
        var yellow = responseJson['yellow_news'].toList();
        var neutral = responseJson['neutral_news'].toList();
        listNews = [List<News>.from(twmp.map((model) => News.fromJson(model))),
        List<News>.from(reds.map((model) => News.fromJson(model))),
       
        List<News>.from(neutral.map((model) => News.fromJson(model))),
         List<News>.from(yellow.map((model) => News.fromJson(model)))
        ];

        return listNews;
      }
    } catch (e) {
      print(e.toString());
    }
    return listNews;
  }
}
