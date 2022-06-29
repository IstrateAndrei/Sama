// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sama/screens/play/HowToPlay.dart';
import 'package:sama/screens/play/NewGameSettings.dart';
import 'package:sama/screens/Settings.dart';

import '../shared/Extensions.dart';
import '../shared/menu_bottom_nav_bar.dart';
import '../util/Utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //screen size variables
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: getTitleTextStyle(),
        ),
        actions: [getSettingsButton(context)],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: getScreen(width, height),
        ),
      ),
    );
  }

  Widget getScreen(double width, double height) {
    Widget title = Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(5),
      child: Text(
        'Sama!',
        textAlign: TextAlign.center,
        style: getTitleTextStyle(),
      ),
    );

    Container logo = Container(
      height: height / 2.2,
      width: width / 2.2,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/logo.jpg'))),
    );

    ElevatedButton newGameButton = ElevatedButton(
      style: getElevatedButtonStyle(),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewGameSettingsScreen();
        }));
      },
      child: getElevationButtonChild('New Game'),
    );

    ElevatedButton howToPlayButton = ElevatedButton(
      style: getElevatedButtonStyle(),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HowToPlayScreen();
        }));
      },
      child: getElevationButtonChild('How to Play?'),
    );

    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        title,
        SizedBox(
          height: 15,
        ),
        logo,
        SizedBox(
          height: 15,
        ),
        newGameButton,
        SizedBox(
          height: 15,
        ),
        howToPlayButton,
      ],
    );
  }
}
