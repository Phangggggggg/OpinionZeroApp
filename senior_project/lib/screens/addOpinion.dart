import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/models/news.dart';
import 'package:flutter/material.dart';
import '../widgets/list_opinion_news_widget.dart';

class AddOpinion extends StatefulWidget {
  const AddOpinion({Key? key}) : super(key: key);

  @override
  State<AddOpinion> createState() => _AddOpinionState();
}

class _AddOpinionState extends State<AddOpinion> {
  late List<News> listNews = [
    News(
        title:
            'เย้ยฝ่ายค้านอภิปรายไม่ไว้วางใจให้สมราคาคุย \nนายกฯ-รัฐมนตรีแจงได้ทุกเรื่อง',
        description:
            'รัฐบาลพร้อมแจงอภิปรายไม่ไว้วางใจ เย้ยฝ่ายค้านทำให้สมราคาคุย ไม่ยอมให้เกิดทุจริตเหมือนรัฐบาลที่ผ่านมา',
        image: Image(
          image: AssetImage('lib/assets/img1.png'),
          width: 2,
          height: 2,
        ),
        imgPath: 'lib/assets/img1.png',
        link: 'https://www.thairath.co.th/news/politic/2412530'),
    News(
        title:
            'เย้ยฝ่ายค้านอภิปรายไม่ไว้วางใจให้สมราคาคุย \nนายกฯ-รัฐมนตรีแจงได้ทุกเรื่อง',
        description:
            'รัฐบาลพร้อมแจงอภิปรายไม่ไว้วางใจ เย้ยฝ่ายค้านทำให้สมราคาคุย ไม่ยอมให้เกิดทุจริตเหมือนรัฐบาลที่ผ่านมา',
        image: Image(
          image: AssetImage('lib/assets/img1.png'),
          width: 2,
          height: 2,
        ),
        imgPath: 'lib/assets/img1.png',
        link: 'https://www.thairath.co.th/news/politic/2412530')
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            'Add Your Opinion',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          child: ListOpinionNewsWidget(listNews),
        ),
      ],
    );
  }
}
