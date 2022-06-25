import 'package:flutter/material.dart';
import 'package:senior_project/models/news.dart';
import 'package:provider/provider.dart';

class ListNewsProvider with ChangeNotifier {

  late List<News> listNews = [
   


    // News(title: 'เย้ยฝ่ายค้านอภิปรายไม่ไว้วางใจให้สมราคาคุย \nนายกฯ-รัฐมนตรีแจงได้ทุกเรื่อง',
    // description: 'รัฐบาลพร้อมแจงอภิปรายไม่ไว้วางใจ เย้ยฝ่ายค้านทำให้สมราคาคุย ไม่ยอมให้เกิดทุจริตเหมือนรัฐบาลที่ผ่านมา',
    // image: Image(image: AssetImage('lib/assets/img1.png'), width: 2,height: 2,),xclass: '1',imgPath:'lib/assets/img1.png',percent: '98%',link: 'https://www.thairath.co.th/news/politic/2412530')
  ];

  late List<News> filterListNews = List.from(listNews);

//   void printList() {
//     filterListNews.forEach((element) {
//       print(element.title);
//     });
//   }
  void fetchListNews(List<News> list) {
    listNews = list;
    filterListNews = List.from(list);
    notifyListeners();
  }

  void filterList(String value) {
    filterListNews = listNews
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
