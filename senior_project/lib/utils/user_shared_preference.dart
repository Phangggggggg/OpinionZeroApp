import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const _keyFilterNews = 'filter_news';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setFilterNews(List<String> filterListNews) async {
    await _preferences.setStringList(_keyFilterNews, filterListNews);
  }

  static Future setUser(String userId, String username, String email) async {
    List<String> lst = [userId, username, email];
    await _preferences.setStringList(_keyUser, lst);
  }

  static List<String> getUser() {
    return _preferences.getStringList(_keyUser)!;
  }

  static List<String> getFilterListNews() {
    return _preferences.getStringList(_keyFilterNews)!;
  }

  static void deleteFilterListNews() async {
    await _preferences.remove(_keyFilterNews);
  }

  static void deleteUser() async {
    await _preferences.remove(_keyUser);
  }
}
