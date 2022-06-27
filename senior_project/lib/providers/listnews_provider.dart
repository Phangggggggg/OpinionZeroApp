import 'package:flutter/material.dart';
import 'package:senior_project/models/news.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/utils/user_shared_preference.dart';

class ListNewsProvider with ChangeNotifier {
  late List<News> opinionListNews = [];
  late List<News> listNews = [];
  late List<News> redListNews = [];
  late List<News> yellowListNews = [];
  late List<News> nuetralListsNews = [];

  late List<News> filterListNews = List.from(listNews);
  late List<News> filterRedListNews = List.from(listNews);
  late List<News> filterYellowListNews = List.from(listNews);
  late List<News> filterNeutralListNews = List.from(listNews);

  void fetchListNews(List<News> list, List<News> reds, List<News> yellows,
      List<News> nuetrals) {
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

  void fetchOpinionListNews(List<News> list) {
    List<String> filterOpinionNews = UserSharedPreference.getFilterListNews();

    if (filterOpinionNews.isNotEmpty) {
      for (String newsId in filterOpinionNews) {
        list.removeWhere((element) => element.id == newsId);
      }
    }
    opinionListNews = list;
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
