import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getSharedPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}

TextStyle getTitleTextStyle() {
  return const TextStyle(
      color: Color(0xFFff9800),
      fontFamily: 'roboto',
      fontWeight: FontWeight.w600,
      fontSize: 32);
}

TextStyle getSubtitleTextStyle() {
  return const TextStyle(
      color: Color(0xFF212121),
      fontFamily: 'roboto',
      fontWeight: FontWeight.w600,
      fontSize: 28);
}

TextStyle getButtonTextStyle() {
  return const TextStyle(
      color: Color(0xFFFFFFFF),
      fontFamily: 'roboto',
      fontWeight: FontWeight.w500,
      fontSize: 24);
}

TextStyle getMessageTextStyle() {
  return const TextStyle(
      color: Color(0xFF757575),
      fontFamily: 'roboto',
      fontWeight: FontWeight.w600,
      fontSize: 20);
}

Widget getElevationButtonChild(String text) {
  return Container(
    padding: EdgeInsets.all(8.0),
    child: Text(text, style: getButtonTextStyle(),),
  );
}

ButtonStyle getElevatedButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 12,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}
