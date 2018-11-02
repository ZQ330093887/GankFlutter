import 'package:shared_preferences/shared_preferences.dart';

class SharedPrfUtils {
  static saveString(String key, value) async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    spf.setString(key, value);
  }

  static saveList(String key, List<String> value) async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    spf.setStringList(key, value);
  }

  static get(String key) async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    return spf.get(key);
  }

  static remove(String key) async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    spf.remove(key);
  }
}
