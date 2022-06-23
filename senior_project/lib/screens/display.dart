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

class Display extends StatefulWidget {
  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  late final List<News> listNews =
      Provider.of<ListNewsProvider>(context).filterListNews;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(2);
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
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 180,
            child: PageView.builder(
                controller: PageController(viewportFraction: 1),
                itemCount: 4,
                itemBuilder: (_, i) {
                  return Container(
                    margin: EdgeInsets.all(9.0),
                    height: 180,
                    width: 170,
                    child: Image.asset(
                      'lib/assets/img1.png',
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
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'Popular',
                ),
                Tab(
                  text: 'Red',
                ),
                Tab(text: 'Neutral'),
                Tab(
                  text: 'Yellow',
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
                builder: (context,listNewsProvider,child) {
                  return NewsListWidget(listNewsProvider.filterListNews);
                }
              ),
              Consumer<ListNewsProvider>(
                builder: (context,listNewsProvider,child) {
                  return NewsListWidget(listNewsProvider.filterListNews);
                }
              ),
              Consumer<ListNewsProvider>(
                builder: (context,listNewsProvider,child) {
                  return NewsListWidget(listNewsProvider.filterListNews);
                }
              ),
              Consumer<ListNewsProvider>(
                builder: (context,listNewsProvider,child) {
                  return NewsListWidget(listNewsProvider.filterListNews);
                }
              )
            ]),
          ),
        ), //
      ],
    );
  }
}
