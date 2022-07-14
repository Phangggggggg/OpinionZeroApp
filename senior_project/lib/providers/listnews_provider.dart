import 'package:flutter/material.dart';
import 'package:senior_project/models/news.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/utils/user_shared_preference.dart';
import "dart:math";
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:senior_project/db/apiUrl.dart';
import 'dart:convert';

class ListNewsProvider with ChangeNotifier {
  int selectedIndex = 0;

  late List<News> opinionListNews = [];
  late List<News> listNews = [];
  late List<News> redListNews = [];
  late List<News> yellowListNews = [];
  late List<News> nuetralListsNews = [];

  late List<News> votedHistoryList = [];
  late List<String> filterOpinionNews = [];
  late List<String> xclassList = [];

  late List<News> filterListNews = List.from(listNews);
  late List<News> filterRedListNews = List.from(listNews);
  late List<News> filterYellowListNews = List.from(listNews);
  late List<News> filterNeutralListNews = List.from(listNews);

  void fetchListNews(List<News> list, List<News> reds, List<News> yellows,
      List<News> nuetrals) {
    // list.shuffle();
    listNews = list;

    redListNews = reds;
    yellowListNews = yellows;
    nuetralListsNews = nuetrals;
    filterListNews = List.from(list);
    filterRedListNews = List.from(redListNews);
    filterYellowListNews = List.from(yellowListNews);
    filterNeutralListNews = List.from(nuetralListsNews);
    notifyListeners();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void fetchOpinionListNews(List<News> list) {
    votedHistoryList = [];
    filterOpinionNews = UserSharedPreference.getFilterListNews();
    xclassList = UserSharedPreference.getXclass();
    final List<News> tmp = List.from(list);
    if (filterOpinionNews.isNotEmpty) {
      for (var i = 0; i < filterOpinionNews.length; i++) {
        list.forEach((element) {
          if (element.id == filterOpinionNews[i]) {
            element.xclass = xclassList[i];
            votedHistoryList.add(element);
            tmp.remove(element);
          }
        });
      }
    }
    opinionListNews = tmp;
    notifyListeners();
  }

  void filterList(String value) {
    filterListNews = listNews
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    filterRedListNews = redListNews
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    filterYellowListNews = yellowListNews
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    filterNeutralListNews = nuetralListsNews
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
