import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/screens/addOpinion.dart';
import 'package:senior_project/screens/display.dart';
import 'display.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Display(),
    AddOpinion(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(    
        body: SingleChildScrollView(
          
          child: 

              _widgetOptions.elementAt(_selectedIndex),
          
          
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
                BottomNavigationBarItem(
                  icon: Icon(Icons.article),
                  label: 'Article',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.question_answer),
                  label: 'Opinion',
                ),
              ],
              currentIndex: _selectedIndex, //RxInt,
              selectedItemColor: Colors.redAccent,
              onTap: _onItemTapped),
        ),
      ),
    );
  }
}
