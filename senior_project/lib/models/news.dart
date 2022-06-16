import 'package:flutter/material.dart';

class News {
  String? title;
  String? description;
  Image? image;
  String? imgPath;
  String? xclass;
  String? percent;
  String? link;
  News(
      {this.title,
      this.description,
      this.image,
      this.xclass,
      this.percent,
      this.link,
      this.imgPath});
}
