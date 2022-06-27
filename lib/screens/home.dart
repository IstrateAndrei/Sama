// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sama/screens/play/how_to_play.dart';
import 'package:sama/screens/play/play_details.dart';
import 'package:sama/screens/settings.dart';

import '../shared/Extensions.dart';
import '../shared/menu_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //screen size variables
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [getSettingsButton(context)],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: getWidgets(sizeX, sizeY),
          ),
        ],
      ),
    );
  }

  List<Widget> getWidgets(double sizeX, double sizeY) {
    List<Widget> list = [];

    Widget title = Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(5),
      child: Text(
        'Sama!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, color: Colors.orange[400]),
      ),
    );

    Container logo = Container(
      height: sizeY / 2.2,
      width: sizeX / 2.2,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/logo.jpg'))),
    );

    // Row rowTitle = Row(
    //   mainAxisSize: MainAxisSize.max,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [title],
    // );
    //
    // Row rowLogo = Row(
    //   mainAxisSize: MainAxisSize.max,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [logo],
    // );

    ElevatedButton newGameButton =
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
          ), onPressed: () {

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PlayDetailsScreen();
            }));
        },
          child: Text('New Game!'),
        );


    ElevatedButton howToPlayButton =
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 12,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
      ), onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HowToPlayScreen();
      }));
    },
      child: Text('How to play?'),
    );

    list.add(title);
    list.add(logo);
    list.add(newGameButton);
    list.add(howToPlayButton);
    return list;
  }
}

