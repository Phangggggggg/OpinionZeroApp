import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:senior_project/db/apiUrl.dart';

class User {
  Future<bool> createUser(String name, String username, String pwd) async {
    try {
      var res = await http.put(Uri.parse(ApiUrl.addUserUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'name': name,
            'username': username,
            'password': pwd
          }));
      if (res.statusCode == 200) {
        return true;
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
      var resBody = res.body;
      if (res.statusCode == 200) {
        var jsonBody = jsonDecode(resBody);
        if (jsonBody['status'] == 'pass') {
          return true;
        }
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
