// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sama/screens/main/Home.dart';
import 'package:sama/screens/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  SharedPreferences? prefs;

  Future<SharedPreferences> getPrefs() async {
    return SharedPreferences.getInstance();
  }


  //Main color Red malt - 0xFFD2302C
  //Main white shade - 0xFFF7F7F9
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Freedom',
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFF7F7F9),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Color(0xFFF7F7F9),
              primary: Color(0xFFD2302C),
            ),
            fontFamily: 'badabb'),
        home: Scaffold(
            body: HomeScreen()
        ));
  }


  Widget getFutureBuilder() {
    return FutureBuilder<SharedPreferences>(
      future: getPrefs(),
      builder: (BuildContext context,
          AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.getBool('not_first_time') == true) {
            return HomeScreen();
          } else {
            snapshot.data?.setBool('not_first_time', true);
            return SplashScreen();
          }
        } else {
          snapshot.data?.setBool('not_first_time', true);
          return SplashScreen();
        }
      },
    );
  }
}
