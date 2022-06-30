import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:senior_project/utils/user_shared_preference.dart';
import '/widgets/icon_wiget.dart';
import 'editProfile.dart';
import '/colors/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(onTap);
  }

  List<bool> _isDisabled = [false, true];
  onTap() {
    if (_isDisabled[_tabController.index]) {
      int index = _tabController.previousIndex;
      setState(() {
        _tabController.index = index;
      });
    }
    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: kOpcBlue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0))),
          height: 150,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle_rounded,
                size: 80,
                color: kBlackBrown,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                UserSharedPreference.getUser()[1],
                style: const TextStyle(
                    color: kBlackBrown,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              indicatorColor: kDarkBlue,
              tabs: [
                Tab(
                  child: Text('About You',
                      style: GoogleFonts.montserrat(
                          color: kBlackBrown, fontWeight: FontWeight.w600)),
                ),
                Tab(
                  // text: 'Log out',
    
                  child: GestureDetector(
                      child: Text('Log out',
                          style: GoogleFonts.montserrat(
                              color: kBlackBrown,
                              fontWeight: FontWeight.w600)),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Log Out"),
                            content:
                                Text('Are you sure you want to Log Out?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    UserSharedPreference.deleteUser();
                                    UserSharedPreference
                                        .deleteFilterListNews();
                                    Get.toNamed('/login');
                                  },
                                  child: Text('Yes')),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('No')),
                            ],
                          ),
                        );
                      }),
                ),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
          child: Container(
            // height: MediaQuery.of(context).size.height,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height,
        
            child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // IconWidget(iconData: Icons.access_alarm, txt: 'edit'),
                  EditProfile(),
                  Text('log out'),
                ]),
          ),
        ),
      ],
    );
  }
}
