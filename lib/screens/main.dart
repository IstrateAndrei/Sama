// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hello_world/screens/home.dart';
import 'package:hello_world/screens/splash/splash_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Freedom',
        theme: ThemeData(
            primarySwatch: Colors.orange,
            secondaryHeaderColor: Colors.green,
            fontFamily: 'roboto'),
        home: Scaffold(
          body: FutureBuilder<SharedPreferences>(
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
          ),
        ));
  }
}
