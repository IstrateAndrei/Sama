// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sama/data/Models/Game.dart';
import 'package:sama/screens/play/Conclusion.dart';
import 'package:sama/util/Utils.dart';

class TimeDisplayScreen extends StatefulWidget {
  const TimeDisplayScreen({Key? key}) : super(key: key);

  @override
  State<TimeDisplayScreen> createState() => _TimeDisplayScreenState();
}

class _TimeDisplayScreenState extends State<TimeDisplayScreen> {
  Timer? countdownTimer;
  Duration? myDuration;

  bool _isTimeStarted = false;
  bool _wasPausedPressed = false;

  /// Timer related methods ///
  // Step 3
  void startTimer(BuildContext context, GameModel gameModel) {
    countdownTimer = Timer.periodic(
        Duration(seconds: 1), (_) => setCountDown(context, gameModel));
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }

  // Step 6
  void setCountDown(BuildContext context, GameModel game) {
    const reduceSecondsBy = 1;
    setState(() {
      _isTimeStarted = true;
      final seconds = myDuration!.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return ConclusionScreen();
                },
                settings: RouteSettings(arguments: game)),
            (Route<dynamic> route) => false);
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    GameModel game = ModalRoute.of(context)!.settings.arguments as GameModel;

    myDuration ??= Duration(minutes: game.timeCount);

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discussion'.toUpperCase(),
          style: getTitleTextStyle(),
        ),
      ),
      body: Center(
        child: Container(
          child: getScreen(context, width, height, game),
        ),
      ),
    );
  }

  Widget getScreen(
      BuildContext context, double width, double height, GameModel game) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration!.inMinutes.remainder(60));
    final seconds = strDigits(myDuration!.inSeconds.remainder(60));

    Widget startTime = Visibility(
        visible: !_isTimeStarted,
        child: ElevatedButton(
            style: getElevatedButtonStyle(),
            onPressed: () {
              //finish discussion -> move to voting screen
              startTimer(context, game);
            },
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: getElevationButtonChild(
                    !_wasPausedPressed ? 'Start Timer' : 'Resume Timer'))));

    Widget pauseTime = Visibility(
        visible: _isTimeStarted,
        child: ElevatedButton(
            style: getElevatedButtonStyle(),
            onPressed: () {
              //finish discussion -> move to voting screen
              _isTimeStarted = false;
              _wasPausedPressed = true;
              stopTimer();
            },
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: getElevationButtonChild('Pause Timer'))));

    Widget endDiscussion = Visibility(
        visible: _isTimeStarted,
        child: ElevatedButton(
            style: getElevatedButtonStyle(),
            onPressed: () {
              //finish discussion -> move to voting screen
              stopTimer();
              //move to voting screen - todo to implement
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return ConclusionScreen();
                      },
                      settings: RouteSettings(arguments: game)),
                  (Route<dynamic> route) {
                return false;
              });
            },
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: getElevationButtonChild('End Discussion'))));

    return Column(
      children: [
        SizedBox(
          height: height / 4,
        ),
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/hourglass.png'),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$minutes:$seconds',
          style: getSubtitleTextStyle(),
        ),
        SizedBox(
          height: 10,
        ),
        startTime,
        pauseTime,
        SizedBox(
          height: 15,
        ),
        endDiscussion,
      ],
    );
  }
}
