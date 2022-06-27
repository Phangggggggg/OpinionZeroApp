import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(2);
    _timer = Timer.periodic(Duration(milliseconds: 5), (Timer timer) {
      if (_currentPage < 5) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 40, 0.0),
                child: IconButton(
                  icon: Icon(Icons.account_circle_rounded, size: 40),
                  onPressed: () {
                    Get.toNamed('/profile');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                child: Text(
                  'Breaking News',
                  // style: GoogleFonts.,
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 180,
            child: PageView.builder(
                controller: _pageController,
                itemCount: 4,
                itemBuilder: (_, i) {
                  return Container(
                    margin: EdgeInsets.all(9.0),
                    height: 180,
                    width: 170,
                    child: Image.asset(
                      'lib/assets/imgOut.png',
                      fit: BoxFit.fill,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(22.0)),
                    ),
                  );
                })),
        SearchBarWidget(),
        Container(
          child: TabBar(
              indicatorSize: TabBarIndicatorSize.values[0],
              labelColor: Colors.black12,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Red',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                    child: Text(
                  'Yellow',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Tab(
                  child: Text(
                    'Neutral',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]),
        ),
        SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height,

            child: TabBarView(controller: _tabController, children: [
              Consumer<ListNewsProvider>(
                  builder: (context, listNewsProvider, child) {
                return NewsListWidget(listNewsProvider.filterListNews);
              }),
              Consumer<ListNewsProvider>(
                  builder: (context, listNewsProvider, child) {
                return NewsListWidget(listNewsProvider.filterRedListNews);
              }),
              Consumer<ListNewsProvider>(
                  builder: (context, listNewsProvider, child) {
                return NewsListWidget(listNewsProvider.filterNeutralListNews);
              }),
              Consumer<ListNewsProvider>(
                  builder: (context, listNewsProvider, child) {
                return NewsListWidget(listNewsProvider.filterYellowListNews);
              })
            ]),
          ),
        ), //
      ],
    );
  }
}
