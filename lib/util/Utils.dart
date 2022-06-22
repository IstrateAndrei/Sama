import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getSharedPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}
