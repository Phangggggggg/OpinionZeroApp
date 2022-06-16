import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({required this.iconData, required this.txt});

  final IconData iconData;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              bottom: 15.0
            ),
            width: 60,
            height: 60,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 70, 69, 69), shape: BoxShape.circle),
            child: Icon(
              iconData,
              color:Colors.white,
              size: 35,
            ),
          ),
          // SizedBox(
          //   height: 4,
          // ),
          Text(
            txt,
          ),
        ]);
  }
}
