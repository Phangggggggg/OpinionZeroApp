import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const _keyFilterNews = 'filter_news';
  static const _keyXclassList = 'xclass';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setFilterNews(List<String> filterListNews) async {
    await _preferences.setStringList(_keyFilterNews, filterListNews);
  }

  static Future setXclass(List<String> xclassList) async {
    await _preferences.setStringList(_keyXclassList, xclassList);
  }

  static Future setUser(String userId, String username, String email,
      String fullname, String birthday, String phone) async {
    List<String> lst = [
      userId,
      username,
      email,
      fullname,
      birthday,
      phone,
    ];
    await _preferences.setStringList(_keyUser, lst);
  }

  static List<String> getUser() {
    if (_preferences.getStringList(_keyUser) != null) {
      return _preferences.getStringList(_keyUser)!;
    }
    return [];
  }

  static List<String> getXclass() {
    if (_preferences.getStringList(_keyXclassList) != null) {
      return _preferences.getStringList(_keyXclassList)!;
    }
    return [];
  }

  static List<String> getFilterListNews() {
    if (_preferences.getStringList(_keyFilterNews) != null) {
      return _preferences.getStringList(_keyFilterNews)!;
    }
    return [];
  }

  static void deleteFilterListNews() async {
    await _preferences.remove(_keyFilterNews);
  }

  static void deleteUser() async {
    await _preferences.remove(_keyUser);
  }
}
