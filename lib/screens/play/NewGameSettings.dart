// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sama/data/Models/Game.dart';
import 'package:sama/screens/play/PickLocation.dart';
import 'package:sama/screens/play/RoleDisplay.dart';
import 'package:sama/util/Utils.dart';

import '../../data/Models/LocationBundle.dart';
import '../../util/LocationGenerator.dart';

class NewGameSettingsScreen extends StatefulWidget {
  const NewGameSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NewGameSettingsScreen> createState() => _NewGameSettingsScreenState();
}

class _NewGameSettingsScreenState extends State<NewGameSettingsScreen> {
  int _playerIndex = 4;
  int _spyIndex = 1;
  int _timeIndex = 10;

  bool _isTotalShitShow = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Game Settings',
            style: getTitleTextStyle(),
          ),
        ),
        body: Column(
          // padding: EdgeInsets.all(8.0),
          children: getItems(context, width, height),
        ));
  }

  List<Widget> getItems(BuildContext context, double width, double height) {
    List<Widget> list = [];

    GameModel model = GameModel();

    Widget players = Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Players: ',
            style: getSubtitleTextStyle(),
          ),
          IconButton(
              onPressed: () {
                if (_playerIndex > 3) {
                  setState(() {
                    _playerIndex -= 1;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    'At least 3 players are required!',
                    style: getSnackMessageTextStyle(),
                  )));
                }
              },
              icon: Icon(Icons.remove_circle_outline)),
          Text(
            _playerIndex.toString(),
            style: getSubtitleTextStyle(),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  _playerIndex += 1;
                });
              },
              icon: Icon(Icons.add_circle_outline))
        ],
      ),
    );

    Widget spies = Visibility(
      visible: !_isTotalShitShow,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Spies: ',
              style: getSubtitleTextStyle(),
            ),
            IconButton(
                onPressed: () {
                  if (_spyIndex > 1) {
                    setState(() {
                      _spyIndex -= 1;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      'No spy, no fun  : ( ',
                      style: getSnackMessageTextStyle(),
                    )));
                  }
                },
                icon: Icon(Icons.remove_circle_outline)),
            Text(
              _spyIndex.toString(),
              style: getSubtitleTextStyle(),
            ),
            IconButton(
                onPressed: () {
                  if (_spyIndex < _playerIndex - 1) {
                    setState(() {
                      _spyIndex += 1;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      'We can\'t all be spies!',
                      style: getSnackMessageTextStyle(),
                    )));
                  }
                },
                icon: Icon(Icons.add_circle_outline))
          ],
        ),
      ),
    );

    Widget time = Visibility(
        visible: !_isTotalShitShow,
        child: Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Time: ',
                style: getSubtitleTextStyle(),
              ),
              IconButton(
                  onPressed: () {
                    if (_timeIndex > 10) {
                      setState(() {
                        _timeIndex -= 1;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Minimum time limit reached!',
                        style: getSnackMessageTextStyle(),
                      )));
                    }
                  },
                  icon: Icon(Icons.remove_circle_outline)),
              Text(
                '$_timeIndex min',
                style: getSubtitleTextStyle(),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _timeIndex += 1;
                    });
                  },
                  icon: Icon(Icons.add_circle_outline))
            ],
          ),
        ));

    Widget shitShowDescription = Visibility(
        visible: _isTotalShitShow,
        child: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Nobody knows how many spies are among the group.\n\nAlso you don\'t know how much time you\'ve got.\n\nHave fun!',
            textAlign: TextAlign.center,
            style: getMessageTextStyle(),
          ),
        ));

    Widget shitShow = Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Total shitshow!',
            style: getShitShowTextStyle(),
          ),
          FlutterSwitch(
              value: _isTotalShitShow,
              showOnOff: true,
              activeColor: Color(0xFFD2302C),
              inactiveColor: Colors.blueGrey.shade500,
              activeTextColor: Color(0xFFF7F7F9),
              inactiveTextColor: Colors.grey,
              onToggle: (value) {
                setState(() {
                  _isTotalShitShow = value;
                });
              })
        ],
      ),
    );

    Widget nextButton = Container(
      child: ElevatedButton(
        style: getElevatedButtonStyle(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    model.playerCount = _playerIndex;
                    model.isShitShow = _isTotalShitShow;

                    if (_isTotalShitShow) {
                      model.spyCount = 1 + Random().nextInt(_playerIndex - 1);
                      model.timeCount = Random().nextInt(20) + 10;
                    } else {
                      model.spyCount = _spyIndex;
                      model.timeCount = _timeIndex;
                    }

                    //todo this is temporary - add pick location screen on next version
                    LocationBundle locBundle = LocationBundle();
                    locBundle.bundle = Locs.basic;
                    locBundle.locations = getLocations(Locs.basic);

                    model.locBundle = locBundle;

                    model.location = getRandomLocation(Locs.basic);

                    return RoleDisplayScreen();
                    //todo change return to PickLocationScreen()
                  },
                  settings: RouteSettings(
                    arguments: model,
                  )));
        },
        child: getElevationButtonChild('Start Game!'),
      ),
    );

    Widget titleImage = Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      height: height / 10,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/sama_full.png'))),
    );

    Widget spaceBox = Visibility(
        visible: !_isTotalShitShow,
        child: SizedBox(
          height: height / 7,
        ));

    list.add(titleImage);
    list.add(players);
    list.add(spies);
    list.add(time);
    list.add(shitShow);
    list.add(shitShowDescription);
    list.add(spaceBox);
    list.add(nextButton);
    return list;
  }
}
