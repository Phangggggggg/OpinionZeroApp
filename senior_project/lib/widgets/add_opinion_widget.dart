import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_project/colors/colors.dart';
import 'package:senior_project/widgets/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:senior_project/utils/user_shared_preference.dart';
import '../models/news.dart';
import '../screens/addOpinion.dart';

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
  Future<void> addOpinionDailog(String newId) async {
    await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: Text('Add Cals Gain/Loss'),
                content: SingleChildScrollView(
                    child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          print("here is clicked");
                          setState(() {
                            voteColor = '2';
                          });
                          
                          print(voteColor);
                        },
                        child: Container(
                          child: Text('button'),
                          margin: EdgeInsets.all(5.0),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: voteColor == '2' ? Colors.green : Colors.red,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(1.0),
                            ),
                          ),
                        )),
                  ],
                )),
              );
            }
          );
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
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('${widget.newsItem.title.toString()}',
                        style: TextStyle(
                          fontSize: 18,
                          overflow: TextOverflow.clip,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${widget.newsItem.description.toString()}',
                      style: TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            minWidth: 100.0,
                            height: 50.0,
                            color: Colors.grey,
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
                          )),
                      Center(
                          child: MaterialButton(
                        minWidth: 100.0,
                        height: 50.0,
                        color: Colors.grey,
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
                  color: Color.fromARGB(255, 253, 255, 255),
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
