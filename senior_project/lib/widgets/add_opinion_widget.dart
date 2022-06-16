import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../models/news.dart';

class AddOpinionWidget extends StatefulWidget {
  News newsItem;
  AddOpinionWidget({required this.newsItem});

  @override
  State<AddOpinionWidget> createState() => _AddOpinionWidgetState();
}

void _launchUrl(Uri url) async {
  if (!await launchUrl(url)) throw 'Could not launch $url';
}

class _AddOpinionWidgetState extends State<AddOpinionWidget> {
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
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.newsItem.imgPath.toString()),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 280,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('title: ${widget.newsItem.title.toString()}'),
                    ],
                  ),
                  Text(
                      'description: ${widget.newsItem.description.toString()}'),
                ],
              ),
              width:MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
            ),
          ),
          Positioned(
            top: 500,
            right: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    _launchUrl(Uri.parse(widget.newsItem.link.toString()));
                  },
                  child: Text('Read'),
                ),
              ),
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                 
                  print('back button is pressed');
                   Get.back();
                },
              )
          ),
        ]),
      ),
    );
  }
}
