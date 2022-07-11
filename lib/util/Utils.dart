// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getSharedPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}

TextStyle getTitleTextStyle() {
  return const TextStyle(
      color: Color(0xFFFFFFFF),
      fontFamily: 'badabb',
      fontWeight: FontWeight.w400,
      fontSize: 26);
}

TextStyle getSubtitleTextStyle() {
  return const TextStyle(
      color: Color(0xFF212121),
      fontFamily: 'badabb',
      fontWeight: FontWeight.w400,
      fontSize: 30);
}

TextStyle getShitShowTextStyle() {
  return const TextStyle(
      color: Color(0xFFD2302C),
      fontFamily: 'badabb',
      fontWeight: FontWeight.w400,
      fontSize: 36);
}

TextStyle getButtonTextStyle() {
  return const TextStyle(
      color: Color(0xFFFFFFFF),
      fontFamily: 'badabb',
      fontWeight: FontWeight.w300,
      fontSize: 24);
}

TextStyle getSnackMessageTextStyle() {
  return const TextStyle(
      color: Color(0xFFFFFFFF),
      fontFamily: 'badabb',
      fontWeight: FontWeight.w300,
      fontSize: 20);
}

TextStyle getMessageTextStyle() {
  return const TextStyle(
      color: Color(0xFF757575),
      fontFamily: 'badabb',
      fontWeight: FontWeight.w400,
      fontSize: 24);
}

Widget getElevationButtonChild(String text) {
  return Container(
    padding: EdgeInsets.all(2.0),
    child: Text(
      text,
      style: getButtonTextStyle(),
    ),
  );
}

Widget getElevationButtonAnimatedChild(
    String text, double width, double height, int duration) {
  return AnimatedContainer(
    width: width,
    height: height,
    padding: EdgeInsets.all(8.0),
    duration: Duration(seconds: duration),
    child: Text(
      text,
      style: getButtonTextStyle(),
    ),
  );
}

ButtonStyle getElevatedButtonStyle() {
  return ElevatedButton.styleFrom(
    elevation: 12,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}

Gradient getBackgroundRadialGradient() {
  return RadialGradient(
      // colors: [Colors.purple.shade100, Colors.purple.shade50, Colors.deepOrangeAccent.shade100, Colors.deepOrangeAccent.shade200],
      colors: [Colors.white, Colors.white, Colors.redAccent.shade100],
      center: Alignment.center,
      radius: 1.2);
}
