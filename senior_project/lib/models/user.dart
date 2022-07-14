import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:senior_project/db/apiUrl.dart';
import 'package:senior_project/utils/user_shared_preference.dart';

class User {
  Future<bool> createUser(String name, String username, String pwd,
      String fullName, String birthday, String phone) async {
    try {
      var res = await http.put(Uri.parse(ApiUrl.addUserUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'name': name,
            'username': username,
            'password': pwd,
            'fullname': fullName,
            'birthday': birthday,
            'phone': phone,
          }));
      if (res.statusCode == 200) {
        var resBody = res.body;
        var jsonBody = jsonDecode(resBody);
        if (jsonBody['status'] == 'add user success') {
          return true;
        }
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  Future<bool> authUser(String username, String pwd) async {
    try {
      var res = await http.put(
        Uri.parse(ApiUrl.authUserUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'username': username, 'password': pwd}),
      );
      if (res.statusCode == 200) {
        var resBody = res.body;
        var jsonBody = jsonDecode(resBody);

        if (jsonBody['status'] == 'fail') {
          return false;
        }
        var jsonUser = jsonBody['user'];
        UserSharedPreference.setUser(
          jsonUser['id'],
          jsonUser['username'],
          jsonUser['email'],
          jsonUser['fullname'],
          jsonUser['birthday'],
          jsonUser['phone'],
        );
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
