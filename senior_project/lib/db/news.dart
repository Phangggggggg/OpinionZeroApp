import 'package:http/http.dart' as http;
import 'package:senior_project/db/apiUrl.dart';
import 'dart:convert';

import 'package:senior_project/models/news.dart';

class NewsDb {

  Future<List<News>>fetchNews() async {
      List<News> listNews = [];
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
        listNews =
            List<News>.from(twmp.map((model) => News.fromJson(model)));
        return listNews;
      }
    } catch (e) {
      print(e.toString());
    }
    return listNews;
  }
  
}
