import 'package:flutter/material.dart';

class News {
  String title;
  String? description;
  Image? image;
  String? imgPath;
  String? xclass;
  String? percent;
  String? link;
  String? date;

  News(
      {required this.title,
      this.description,
      this.image,
      this.xclass,
      this.percent,
      this.link,
      this.imgPath,
      this.date});

  static News fromJson(json) {
    News news = new News(
      title: json["title"],
      description: json ["description"],
      percent: json["percent"],
      xclass: json["perdicted_class"],
      link: json["link"]
    );
    return news;
  }
}
