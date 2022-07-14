import 'dart:async';
import 'package:senior_project/widgets/logo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:senior_project/colors/colors.dart';
import 'package:senior_project/utils/user_shared_preference.dart';
import '/colors/colors.dart';
import 'package:senior_project/models/news.dart';
import 'package:get/get.dart';
import 'package:senior_project/providers/listnews_provider.dart';

import '../widgets/new_list_widget.dart';
import 'addOpinion.dart';
import 'profile.dart';
import '../widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

class Display extends StatefulWidget {
  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController =
      PageController(viewportFraction: 1, initialPage: 0);
  // late Timer _timer;
  // int _currentPage = 0;
  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  static const String rootImgPath = "lib/assets/images/";
  List<News> lst = [
    News(
        id: '62b933467e399ee039e9d790',
        title:
            '"บิณฑ์ บรรลือฤทธิ์" นัดรวมพลังชาวชลบุรี เทิดทูนและปกป้องสถาบันพระมหากษัตริย์ เย็นนี้',
        imgPath: "img93",
        link: "https://www.nationtv.tv/news/378805393"),
    News(
        id: '62b933467e399ee039e9d795',
        title: "'‘บิ๊กป้อม’ จ่อตั้ง ‘สันติ พร้อมพัฒน์’ รักษาการเลขาฯพปชร.",
        imgPath: "img130",
        link: "https://www.dailynews.co.th/news/701608/"),
    News(
        id: '62b933467e399ee039e9d79d',
        title: "“นายกฯตู่” ยันไม่ท้อ แม้ผลโพลบอกคะแนนนิยมลด ปัดส่งคนดีลทักษิณ",
        imgPath: "img17",
        link: "https://www.topnews.co.th/news/270525"),
    News(
        id: '62b933467e399ee039e9d7c0',
        title:
            "'‘ไฟเซอร์ฝาส้ม’ ถึงไทย 3 แสนโด๊ส สธ. ลั่น ดีเดย์ฉีดเด็ก 31 ม.ค.",
        imgPath: "img129",
        link: "https://www.dailynews.co.th/news/703656/")
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(2);
  }

  @override
  void dispose() {
    super.dispose();
    // _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ListNewsProvider>(
        builder: (context, listNewsProvider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 20.0, 0.0, 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Breaking News',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: kBlackBrown),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: Container(
                      width: 100,
                      height: 4,
                      color: kDarkBlue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 110,
                      height: 5,
                      color: kLightBlue,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              height: 190,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: 4,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {
                        _launchUrl(Uri.parse(lst[i].link.toString()));
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(9.0, 0.0, 9.0, 0.0),
                        height: 180,
                        width: 170,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              rootImgPath + lst[i].imgPath.toString() + ".png",
                              fit: BoxFit.fill,
                            )),
                      ),
                    );
                  })),
          SizedBox(
            height: 14.0,
          ),
          SearchBarWidget(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0.0, 8, 0.0),
            child: Container(
              // child: ColoredBox(
              // color: Color.fromARGB(255, 228, 228, 228),
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: kDarkBlue,
                  unselectedLabelColor: kBlackBrown,
                  indicatorColor: kLightBlue,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        'All',
                        style: GoogleFonts.mitr(
                          textStyle: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Red',
                        style: GoogleFonts.mitr(
                          textStyle: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text('Yellow',
                          style: GoogleFonts.mitr(
                            textStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          )),
                    ),
                    Tab(
                        child: Text('Neutral',
                            style: GoogleFonts.mitr(
                              textStyle: const TextStyle(
                                fontSize: 15,
                              ),
                            )))
                  ]),
            ),
          ),
          // ),
          SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,

              child: TabBarView(controller: _tabController, children: [
                NewsListWidget(listNewsProvider.filterListNews, 1),
                NewsListWidget(listNewsProvider.filterRedListNews, 1),
                NewsListWidget(listNewsProvider.filterNeutralListNews, 1),
                NewsListWidget(listNewsProvider.filterYellowListNews, 1),
              ]),
            ),
          ), //
        ],
      );
    });
  }
}
