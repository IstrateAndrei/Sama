// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sama/data/Models/Game.dart';
import 'package:sama/screens/play/PickLocation.dart';
import 'package:sama/util/Utils.dart';

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
        body: ListView(
          padding: EdgeInsets.all(8.0),
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
                if (_playerIndex > 0) {
                  setState(() {
                    _playerIndex -= 1;
                  });
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
                  if (_spyIndex > 0) {
                    setState(() {
                      _spyIndex -= 1;
                    });
                  }
                },
                icon: Icon(Icons.remove_circle_outline)),
            Text(
              _spyIndex.toString(),
              style: getSubtitleTextStyle(),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    _spyIndex += 1;
                  });
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
                    if (_timeIndex > 0) {
                      setState(() {
                        _timeIndex -= 1;
                      });
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


    Widget shitShow = Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Total shitshow!', style: getShitShowTextStyle(),),
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
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(32.0),
      child: ElevatedButton(
        style: getElevatedButtonStyle(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    model.playerCount = _playerIndex;
                    model.spyCount = _spyIndex;
                    model.timeCount = _timeIndex;
                    model.isShitShow = _isTotalShitShow;
                    return PickLocationScreen();
                  },
                  settings: RouteSettings(
                    arguments: model,
                  )));
        },
        child: getElevationButtonChild('NEXT'),
      ),
    );

    list.add(players);
    list.add(spies);
    list.add(time);
    list.add(shitShow);
    list.add(nextButton);
    return list;
  }
}
