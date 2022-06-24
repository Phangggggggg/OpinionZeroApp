import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import '/widgets/icon_wiget.dart';
import 'editProfile.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(80, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              // IconButton(icon: Icon(Icons.access_time_filled  , size: 30, color: Colors.grey[800] ,),onPressed: (){},),
              Text(
                "Account",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 186, 185, 185),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 30, 50, 0.0),
              child: IconButton(
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: 80,
                  color: Colors.grey[800],
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 9, 0.0),
              child: Text(
                'Username',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 10, 0.0, 0.0),
              child: Text(
                'username@gmail.com',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.00, 20, 0.0, 0.0),
              child: Container(
                child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: 'Edirt profile',
                      ),
                      Tab(
                        // text: 'Log out',
                  
                        child: 
                         GestureDetector(
                          child: Text('Log out'),
                          onTap: () {
                               showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Log Out"),
                                        content: Text(
                                            'Are you sure you want to Log Out?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Get.toNamed('/login'),
                                              child: Text('Yes')
                                          ), 
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text('No')
                                          ),
                                      
                                        ],
                                      ),
                                    );
                         } ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height,

                  child: TabBarView(controller: _tabController,
                          physics: const NeverScrollableScrollPhysics(),

                  children: [
                    // IconWidget(iconData: Icons.access_alarm, txt: 'edit'),
                    EditProfile(),
                    Text('log out'),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
