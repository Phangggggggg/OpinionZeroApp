import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  static late SharedPreferences _preferences;

  static const _keyUsername = 'username';
  static const _keyUser = 'user';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async {
    await _preferences.setString(username, username);
  }

  static Future setUser( String userId,String username,String email) async {
    List<String> lst = [userId, username,email];
    await _preferences.setStringList(_keyUser, lst);
  }

  static List<String> getUser() {
    return _preferences.getStringList(_keyUser)!;
  }

  static void deleteUser() async {
    await _preferences.remove(_keyUser);
  }
}
