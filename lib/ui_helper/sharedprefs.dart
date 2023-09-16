import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  saveString(String key, String value) async {
    var sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.setString(key, value);
  }

  readString(String key) async {
    var sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.getString(key);
  }

  clear() async {
    var sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear();
  }
}
