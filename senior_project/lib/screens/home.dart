import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/colors/colors.dart';
import 'package:senior_project/models/news.dart';
import 'package:senior_project/providers/listnews_provider.dart';
import 'package:senior_project/screens/addOpinion.dart';
import 'package:senior_project/screens/display.dart';
import 'package:senior_project/screens/profile.dart';
import 'package:senior_project/utils/user_shared_preference.dart';
import 'display.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String userId = UserSharedPreference.getUser()[0];
  static List<Widget> _widgetOptions = <Widget>[
    Display(),
    AddOpinion(),
    Profile(),
  ];

  @override
  initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    News n = News(id: "xx", title: "rr");
    n.fetchNews().then((lst) => context
        .read<ListNewsProvider>()
        .fetchListNews(lst[0], lst[1], lst[2], lst[3]));
    n.filterNewsByUser(userId);
    n.fetchOpinionNews().then(
        (lst) => context.read<ListNewsProvider>().fetchOpinionListNews(lst));
    return SafeArea(
      child: Scaffold(
         backgroundColor: kWhite1,
        body: SingleChildScrollView(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey.shade200))),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              items: [
                const BottomNavigationBarItem(
                  icon: const Icon(Icons.article),
                  label: 'Article',
                ),
               const BottomNavigationBarItem(
                  icon: const Icon(Icons.question_answer),
                  label: 'Opinion',
                ),
                const BottomNavigationBarItem(
                  icon: const Icon(Icons.account_circle_rounded),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex, //RxInt,
              selectedItemColor: kDarkBlue,
              // unselectedItemColor:kBlue,
              onTap: _onItemTapped),
        ),
      ),
    );
  }
}
