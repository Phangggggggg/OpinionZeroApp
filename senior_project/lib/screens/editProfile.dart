import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '/widgets/icon_wiget.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            // height: 300,
            margin:  EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconWidget(iconData: Icons.favorite_border, txt: 'Favorite'),
              IconWidget(iconData: Icons.feed, txt: 'Voted History'),
              IconWidget(iconData: Icons.person, txt: 'About You'),
            ],
          ),
        ),
        Row(
          children: [],
        ),
        Row(
          children: [],
        )
      ],
    );
  }
}
