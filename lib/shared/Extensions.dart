// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../screens/main/Settings.dart';

Widget getSettingsButton(BuildContext context) {
  return IconButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsScreen()));
      },
      icon: Icon(Icons.settings));
}
