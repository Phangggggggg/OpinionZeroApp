import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/utils/user_shared_preference.dart';
import 'package:senior_project/widgets/about_you_widget.dart';
import '/widgets/icon_wiget.dart';
import '../widgets/about_you_widget.dart';
import 'package:senior_project/colors/colors.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final List<String> userInfos = UserSharedPreference.getUser();
  //[userId, username, email,fullname,birthday,phone,city];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AboutYouWidget(
        title: 'Username',
        icon: Icons.person_rounded,
        actualUser: userInfos[1],
        iconColor: kDarkBlue,
      ),
      AboutYouWidget(
        title: 'Email',
        icon: Icons.email_rounded,
        actualUser: userInfos[2],
        iconColor: kLightBlue,
      ),
      AboutYouWidget(
        title: 'Full Name',
        icon: Icons.account_box,
        actualUser: userInfos[3],
        iconColor: kDarkBlue,
      ),
      AboutYouWidget(
          title: 'Birthday',
          icon: Icons.calendar_month,
          actualUser: userInfos[4],
          iconColor: kLightBlue),
      AboutYouWidget(
          title: 'Phone',
          icon: Icons.add_ic_call,
          actualUser: userInfos[5],
          iconColor: kDarkBlue),
    ]);
  }
}
