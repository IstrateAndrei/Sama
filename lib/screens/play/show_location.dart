// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sama/data/Models/Game.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowLocationScreen extends StatefulWidget {
  SharedPreferences? prefs;

  Future<SharedPreferences> getPrefs() async {
    return SharedPreferences.getInstance();
  }

  ShowLocationScreen({Key? key}) : super(key: key);

  @override
  State<ShowLocationScreen> createState() => _ShowLocationScreenState();
}

class _ShowLocationScreenState extends State<ShowLocationScreen> {
  @override
  Widget build(BuildContext context) {

    final game = ModalRoute.of(context)!.settings.arguments as GameModel;



    return Container();
  }
}
