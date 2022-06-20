import 'package:flutter/material.dart';

class News {
  String? title;
  String? description;
  Image? image;
  String? imgPath;
  String? xclass;
  String? percent;
  String? link;
  String? date;
  News(
      {this.title,
      this.description,
      this.image,
      this.xclass,
      this.percent,
      this.link,
      this.imgPath
      ,this.date});
}
