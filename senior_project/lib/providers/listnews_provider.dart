import 'package:flutter/material.dart';
import 'package:senior_project/models/news.dart';
import 'package:provider/provider.dart';

class ListNewsProvider with ChangeNotifier {
  late List<News> listNews = [];
  late List<News> redListNews = [];
  late List<News> yellowListNews = [];
  late List<News> nuetralListsNews = [];

  late List<News> filterListNews = List.from(listNews);
  late List<News> filterRedListNews = List.from(listNews);
  late List<News> filterYellowListNews = List.from(listNews);
  late List<News> filterNeutralListNews = List.from(listNews);

//   void printList() {
//     filterListNews.forEach((element) {
//       print(element.title);
//     });
//   }
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
