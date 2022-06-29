// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sama/data/Models/Game.dart';
import 'package:sama/screens/play/TimeDisplay.dart';
import 'package:sama/util/LocationGenerator.dart';
import 'package:sama/util/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoleDisplayScreen extends StatefulWidget {
  RoleDisplayScreen({Key? key}) : super(key: key);

  @override
  State<RoleDisplayScreen> createState() => _RoleDisplayScreenState();
}

class _RoleDisplayScreenState extends State<RoleDisplayScreen> {
  SharedPreferences? prefs;

  Future<SharedPreferences> getPrefs() async {
    return SharedPreferences.getInstance();
  }

  int _playerCounter = 0;
  bool _isRuleRead = false;
  bool _shouldHandDevice = true;
  bool _showStartDiscussion = false;

  //generate spy position

  List<String> roles = [];

  List<String> establishRoles(GameModel game) {
    List<String> decidedRoles = [];
    for (int i = 0; i < game.spyCount; i++) {
      decidedRoles.add('Spy');
    }

    while (decidedRoles.length < game.playerCount) {
      decidedRoles.add(getRandomElement(game.location!.roles));
    }
    log(decidedRoles.toString());

    decidedRoles.shuffle();
    return decidedRoles;
  }

  @override
  Widget build(BuildContext context) {
    GameModel game = ModalRoute.of(context)!.settings.arguments as GameModel;

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    if (roles.isEmpty) {
      roles = establishRoles(game);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Player ${_playerCounter + 1}',
          style: getTitleTextStyle(),
        ),
      ),
      body: Center(
        child: Container(
          child: getProperScreen(context, width, height, game),
        ),
      ),
    );
  }

  Widget getProperScreen(
      BuildContext context, double width, double height, GameModel game) {
    if (!_isRuleRead) {
      return getRulesTextScreen(context, width, height, game);
    } else {
      if (_shouldHandDevice) {
        return getHandDeviceScreen(context, width, height, game);
      } else if (_showStartDiscussion) {
        return getStartDiscussionScreen(context, width, height, game);
      } else {
        return getRoleDisplayScreen(context, width, height, game);
      }
    }
  }

  Widget getStartDiscussionScreen(
      BuildContext context, double width, double height, GameModel game) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/logo.jpg'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Discussion',
            style: getSubtitleTextStyle(),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Players now take turns asking each other questions about the secret location.\nThe game master starts by choosing one player to ask a question. After answering that player may select the next player to ask a question.',
            style: getMessageTextStyle(),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: getElevatedButtonStyle(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return TimeDisplayScreen();
                        },
                        settings: RouteSettings(
                          arguments: game,
                        )));
              },
              child: getElevationButtonChild('Start Discussion')),
        ],
      ),
    );
  }

  Widget getRulesTextScreen(
      BuildContext context, double width, double height, GameModel game) {
    return Container(
      margin: EdgeInsets.all(32.0),
      child: Column(
        children: [
          SizedBox(
            height: height / 30,
          ),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/logo.jpg'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: height / 30,
          ),
          Text(
            'Player ${_playerCounter + 1} is the game master',
            textAlign: TextAlign.center,
            style: getSubtitleTextStyle(),
          ),
          SizedBox(
            height: height / 40,
          ),
          Text(
            'Players should sit in a big circle facing each other. The game master reads the instructions and hands the device to the other players.',
            textAlign: TextAlign.center,
            style: getMessageTextStyle(),
          ),
          SizedBox(
            height: height / 40,
          ),
          Text(
            'Each player will see the secret location or know that they are the spy.',
            textAlign: TextAlign.center,
            style: getMessageTextStyle(),
          ),
          SizedBox(
            height: height / 15,
          ),
          ElevatedButton(
              style: getElevatedButtonStyle(),
              onPressed: () {
                setState(() {
                  _isRuleRead = true;
                });
              },
              child: getElevationButtonChild('Ready'))
        ],
      ),
    );
  }

  Widget getHandDeviceScreen(
      BuildContext context, double width, double height, GameModel game) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height / 10,
        ),
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/logo.jpg'),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          height: height / 20,
        ),
        Text(
          'Player: ${_playerCounter + 1}',
          style: getSubtitleTextStyle(),
        ),
        SizedBox(
          height: height / 20,
        ),
        Text(
          'Hand the device to this player.\nTap on the image when ready!',
          style: getMessageTextStyle(),
        ),
        SizedBox(
          height: height / 20,
        ),
        ElevatedButton(
            style: getElevatedButtonStyle(),
            onPressed: () {
              setState(() {
                _shouldHandDevice = false;
              });
            },
            child: getElevationButtonChild('Show Role')),
      ],
    );
  }

  Widget getRoleDisplayScreen(
      BuildContext context, double width, double height, GameModel game) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: Color(0x55212121)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height / 10,
          ),
          SizedBox(
            height: height / 20,
          ),
          getLocationWidget(roles[_playerCounter], game.location!.locationName),
          SizedBox(
            height: 10,
          ),
          getRoleWidget(roles[_playerCounter]),
          SizedBox(
            height: height / 6,
          ),
          ElevatedButton(
            style: getElevatedButtonStyle(),
            onPressed: () {
              setState(() {
                if (_playerCounter < roles.length - 1) {
                  _playerCounter += 1;
                  _shouldHandDevice = true;
                } else {
                  _showStartDiscussion = true;
                }
              });
            },
            child: getElevationButtonChild('OK'),
          )
        ],
      ),
    );
  }

  Widget getLocationWidget(String role, String location) {
    if (role == 'Spy') {
      return Text(
        'SAMA!\nYou are the Spy!',
        textAlign: TextAlign.center,
        style: getSubtitleTextStyle(),
      );
    } else {
      return Text(
        'Location: $location',
        style: getSubtitleTextStyle(),
      );
    }
  }

  Widget getRoleWidget(String role) {
    if (role == 'Spy') {
      return Text(
        'Blend in and figure out the location!',
        style: getMessageTextStyle(),
      );
    } else {
      return Text(
        'Role: $role',
        style: getMessageTextStyle(),
      );
    }
  }
}
