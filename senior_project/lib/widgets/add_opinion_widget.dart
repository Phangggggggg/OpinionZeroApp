import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/colors/colors.dart';
import 'package:senior_project/providers/listnews_provider.dart';
import 'package:senior_project/widgets/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:senior_project/utils/user_shared_preference.dart';
import '../models/news.dart';
import '../screens/addOpinion.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddOpinionWidget extends StatefulWidget {
  News newsItem;
  bool trackRedScreen = false;
  bool trackYellowScreen = false;
  bool trackNeutralScreen = false;
  AddOpinionWidget({required this.newsItem});

  @override
  State<AddOpinionWidget> createState() => _AddOpinionWidgetState();
}

void _launchUrl(Uri url) async {
  if (!await launchUrl(url)) throw 'Could not launch $url';
}

void changeVote(String voteColor, String val) {
  voteColor = val;
}

class _AddOpinionWidgetState extends State<AddOpinionWidget> {
  String voteColor = "";
  static const String rootImgPath = "lib/assets/images/";
    String formatDate(String date) {
    String now;
    try {
      DateTime d = DateTime.parse(date);
      now = DateFormat.yMMMd().format(d);
    } catch (e) {
      now = "";
    }

    return now;
  }
  Future<void> addOpinionDailog(String newId) async {
    double width = 71;
    double height = 50;

    await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return AlertDialog(
              title: Text('Please select of the options below'),
              content: SingleChildScrollView(
                  child: ListBody(
                children: [
                  Text(
                    'If you are certain clicking Ok or click cancel to cancel the voting.',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(

                          onTap: () {
                            setState(() {
                              voteColor = '0';
                            });
                          },
                          activeColor: kNeutral,
                          inactiveColor: kWhite,
                          active: voteColor == '0',
                          widget: voteColor == '0'
                              ? Text(
                                  'Neutral',
                                  style: TextStyle(color: Colors.white),
                                )
                              : Text(
                                  'Neutral',
                                  style: TextStyle(color: Colors.black),
                                ),
                          height: height,
                          width: width),
                      ButtonWidget(
                          onTap: () {
                            setState(() {
                              voteColor = '1';
                            });
                          },
                          activeColor: kYellow,
                          inactiveColor: kWhite,
                          active: voteColor == '1',
                          widget: voteColor == '1'
                              ? Text(
                                  'Yellow',
                                  style: TextStyle(color: Colors.white),
                                )
                              : Text(
                                  'Yellow',
                                  style: TextStyle(color: Colors.black),
                                ),
                          height: height,
                          width: width),
                      ButtonWidget(
                          onTap: () {
                            setState(() {
                              voteColor = '2';
                            });
                          },
                          activeColor: kRed,
                          inactiveColor: kWhite,
                          active: voteColor == '2',
                          widget: voteColor == '2'
                              ? Text(
                                  'Red',
                                  style: TextStyle(color: Colors.white),
                                )
                              : Text(
                                  'Red',
                                  style: TextStyle(color: Colors.black),
                                ),
                          height: height,
                          width: width),
                    ],
                  ),
                ],
              )),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        voteColor = "";
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Cancel', style: TextStyle(color: kBlue))),
                TextButton(
                    onPressed: () async {
                      String userId = UserSharedPreference.getUser()[0];
                      await News(id: 'aa', title: 'ff')
                          .addOpinion(voteColor, newId, userId)
                          .then((value) => print(value));
                      setState(() {
                        voteColor = "";
                      });
                     
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text('Ok',style: TextStyle(color:kDarkBlue ),)),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
            right: 0,
            left: 0,
            child: Container(
              // child: Image.asset(widget.newsItem.imgPath.toString()),

              width: double.maxFinite,
              height: 320,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(rootImgPath +
                          widget.newsItem.imgPath.toString() +
                          ".png"),
                      fit: BoxFit.cover)),
            ),
          ),

          Positioned(
            top: 280,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const  EdgeInsets.fromLTRB(180.0, 0.0, 0.0, 8.0),
                      child: Container(    
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                          color: kDarkBlue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                         ),
                         child: Row(
                          children: [
                            Padding(
                            padding: const EdgeInsets.fromLTRB(17.0, 8, 8, 10),
                              child: Icon(Icons.calendar_month_outlined, color: Colors.white),
                            ), 
                            Text(formatDate(widget.newsItem.date.toString()),
                            style: 
                                TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  overflow: TextOverflow.clip,
                                  fontWeight: FontWeight.bold,
                                )
                             )
                            ]
                          ),
                      ),
                    ),
                    Padding(
                    padding: const EdgeInsets.fromLTRB(17.0, 8, 8, 10),
                    child: Text('${widget.newsItem.title.toString()}',
                        style: GoogleFonts.mitr(textStyle:  TextStyle(
                          fontSize: 18,
                          overflow: TextOverflow.clip,
                          fontWeight: FontWeight.w400,
                        ),),
                        
                       ),
                    ),

                    Padding(
                    padding: const EdgeInsets.fromLTRB(17.0, 0.0, 8, 10.0),
                    child: Text(
                      '${widget.newsItem.description.toString()}',
                      style: GoogleFonts.mitr(textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        overflow: TextOverflow.clip,
                      )),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            minWidth: 100.0,
                            height: 45.0,
                            color: kBlue,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            onPressed: () {
                              _launchUrl(
                                  Uri.parse(widget.newsItem.link.toString()));
                            },
                            child: Text(
                              'Read',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          )
                      ),

                      Center(
                        child: MaterialButton(
                          minWidth: 100.0,
                          height: 45.0,
                          color: kLightBlue,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          onPressed: () {
                            addOpinionDailog(widget.newsItem.id);
                          },
                          child: Text(
                            'Vote',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ))
                    ])
                  ],
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: kWhite1,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_circle_left_sharp,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  print('back button is pressed');
                  Get.back();
                },
              )),
        ]),
      ),
    );
  }
}
