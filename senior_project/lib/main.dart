import 'package:flutter/material.dart';
import 'package:senior_project/screens/addOpinion.dart';
import 'package:senior_project/screens/display.dart';
import 'package:senior_project/screens/home.dart';
import 'package:senior_project/screens/profile.dart';
import 'package:senior_project/screens/register.dart';
import 'package:senior_project/screens/splash.dart';

import 'screens/login.dart';
import 'package:get/get.dart';
import 'db/user.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  //   var backend = new Backend();
  // print(backend.createUser('Phang','Phang', '1234'));
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/register', page: () => Register()),
        GetPage(name: '/profile', page: () => Profile()),
        // GetPage(name: '/add',page: () => AddOpinionWidget());
      ],
    );
  }
}
