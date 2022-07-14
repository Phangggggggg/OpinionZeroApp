import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:senior_project/db/apiUrl.dart';
import 'package:senior_project/utils/user_shared_preference.dart';

class News {
  String id;
  String title;
  String? description;
  String? imgPath;
  String? xclass;
  String? percent;
  String? link;
  String? date;

  News(
      {required this.id,
      required this.title,
      this.description,
      this.xclass,
      this.percent,
      this.link,
      this.imgPath,
      this.date});

  static News fromJson(json) {
    News news = new News(
        id: json['id'],
        title: json["title"],
        description: json["description"],
        percent: json["percent"],
        imgPath: json["img"],
        date: json["date"],
        xclass: json["perdicted_class"],
        link: json["link"]);
    return news;
  }

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
        listNews = [
          List<News>.from(twmp.map((model) => News.fromJson(model))),
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

  Future<List<News>> fetchOpinionNews() async {
    List<News> listOpinion = [];
    try {
      var res = await http.put(
        Uri.parse(ApiUrl.retrieveOpinionUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200) {
        var responseJson = jsonDecode(utf8.decode(res.bodyBytes));
        var tmp = responseJson['test_opinion'].toList();
        listOpinion = List<News>.from(tmp.map((model) => News.fromJson(model)));
        return listOpinion;
      }
    } catch (e) {
      print(e.toString());
    }
    return listOpinion;
  }

  Future<bool> addOpinion(String xclass, String newsId, String userId) async {
    try {
      var res = await http.put(Uri.parse(ApiUrl.addOpinionUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'user_id': userId,
            'news_id': newsId,
            'xclass': xclass
          }));
      if (res.statusCode == 200) {
        var resBody = res.body;
        var jsonBody = jsonDecode(resBody);
        if (jsonBody['status'] == 'add opinion success') {
          return true;
        }
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  Future<bool> filterNewsByUser(String userId) async {
    try {
      var res = await http.put(Uri.parse(ApiUrl.filterNewsUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'user_id': userId,
          }));
      if (res.statusCode == 200) {
        var resBody = res.body;
        var jsonBody = jsonDecode(resBody);
        if (jsonBody['status'] == 'Success') {
          List<String> newList = [];
          List<String> xclassList = [];
          List<dynamic> dyList = jsonBody['news_ids'];
          // print(dyList);
          dyList.forEach(
            (element) {
              newList.add(element['news_id']);
              xclassList.add(element['xclass']);
            },
          );
          UserSharedPreference.setFilterNews(newList);
          UserSharedPreference.setXclass(xclassList);
          return true;
        }
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }
}
